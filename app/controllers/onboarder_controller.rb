class OnboarderController < ApplicationController
  before_action :set_human

  def index
  end

  def what
    @is_signed_up = signed_up?
  end

  def why
  end

  def ical
    file_path = Rails.root.join('public', 'downloads', 'invite.ics')
    puts file_path
    send_file file_path, type: 'text/x-vCalendar', filename: 'invite.ics'
  end

  def signup
    new_human if force_param
    @courses = Course.all
  end

  def choose_team
    if save_education
      @all_teams = Team.all
      @available_teams = Team.get_teams(@human.course.competence)
      @competence = Team.get_title(@human.course.competence)
      render
    else
      redirect_to :signup
    end
  end

  def fill_email
    human_saved = save_team
    if human_saved
      render
    else
      redirect_to :choose_team
    end
  end

  def confirmation
    email_saved = save_email
    if email_saved
      ConfirmationMailer.confirmation_email(@human).deliver_now
      redirect_to :receipt
    else
      redirect_to :fill_email
    end
  end

  def receipt
    @human = Human.find_by(uuid: uuid_param) if !uuid_param.blank?
    if signed_up?
      @team_name = @human.team.name
      render
    else
      redirect_to root_path
    end
  end

  private

  def signed_up?
    !@human.course.blank? && !@human.team.blank? && !@human.email.blank?
  end

  def save_education
    valid_education = Course.valid_education?(institution_param,
                                                  course_param,
                                                  year_param)
    return false unless valid_education
    @human.course = Course.find_by(code: course_param)
    @human.study_year = year_param
    @human.save
  end

  def save_team
    valid_team = Team.available_team?(team_param, @human.course.competence)
    return false unless valid_team
    @human.team_id = team_param
    @human.save
  end

  def save_email
    @human.email = email_param
    @human.save
  end

  def set_human
    @uuid = cookies[:uuid]
    if @uuid.blank?
      new_human
    else
      @human = Human.find_by(uuid: @uuid)
    end
    new_human if @human.nil?
  end

  def new_human
    @human = Human.new
    @human.save!
    cookies[:uuid] = { value: @human.uuid, expires: 1.year.from_now }
  end

  def institution_param
    params.permit("institution")["institution"]
  end

  def course_param
    params.permit("course")["course"]
  end

  def year_param
    params.permit("year")["year"].to_i
  end

  def team_param
    params.permit("team")["team"].to_i
  end

  def email_param
    params.permit("email")["email"]
  end

  def uuid_param
    params.permit("uuid")["uuid"]
  end

  def force_param
    force = params.permit("force")["force"]
    return false if force.blank?
    force.upcase == 'TRUE'
  end
end
