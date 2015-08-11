class OnboarderController < ApplicationController
  before_action :set_human

  def index
  end

  def what
  end

  def why
  end

  def ical
    file_path = Rails.root.join('public', 'downloads', 'invite.ics')
    puts file_path
    send_file file_path, type: 'text/x-vCalendar', filename: 'invite.ics'
  end

  def signup
    @institutions = Institution.all
  end

  def choose_team
    human_saved = save_education
    if human_saved
      @available_teams = Team.get_teams(@human.course.competence)
      render
    else
      redirect_to 'signup'
    end
  end

  private

  def save_education
    valid_education = Course.valid_education?(institution_param,
                                                  course_param,
                                                  year_param)
    return redirect_to 'signup' unless valid_education
    @human.course = Course.find_by(code: course_param)
    @human.study_year = year_param
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
end
