class OnboarderController < ApplicationController
  before_action :set_human

  def index
  end

  def what
    @is_signed_up = @human.signed_up?
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

  def choose_competence
    @competences = Competence.all
    if save_education
      render
    else
      redirect_to :signup
    end
  end

  def choose_team
    if save_competence
      @study_year = @human.study_year
      @sorted_teams = Team.sorted_teams(@competence, @study_year)
      render
    else
      redirect_to :signup
    end
  end

  def automatic_selection
    @study_year = @human.study_year
    @competence = @human.competence
    @sorted_teams = Team.sorted_teams(@competence, @study_year)
    matched_team = Team.available_teams(@competence, @sorted_teams.select.first.second)
    @human.team_id = matched_team.first.id
    @human.save
    render :fill_email
  end


  def fill_email
    present_email
    human_saved = save_team
    if human_saved
      render
    else
      redirect_to :choose_team
    end
  end

  def present_email
    email_saved = save_email unless email_param.blank?
  end

  def confirmation
    if present_email == true
      send_members
      ConfirmationMailer.confirmation_email(@human).deliver_later
      redirect_to :receipt
    else
      flash.now[:notice] = "Hoppsan! E-postadressen är inte riktigt rätt. Kolla igenom den en gång till."
      render :fill_email
    end
end

def receipt
    @human = Human.find_by(uuid: uuid_param) if !uuid_param.blank?
    get_email
    if @human.signed_up?
      @team_name = @human.team.name
      render
    else
      redirect_to root_path
    end
  end

  def get_email
    @list_of_emailaddresses_and_competences = []
    @human = Human.find_by(uuid: uuid_param) if !uuid_param.blank?
    team = @human.team
    humen = team.humen
    humen.each do |human|
      if human.team_id == team.id
        @list_of_emailaddresses_and_competences.push([human.email, human.competence.singular])
      end
    end
  end

  def get_email
    @list_of_emailaddresses_and_competences = []
    @human = Human.find_by(uuid: uuid_param) if !uuid_param.blank?
    team = @human.team
    humen = team.humen
    humen.each do |human|
      if human.team_id == team.id
        @list_of_emailaddresses_and_competences.push([human.email, human.competence.singular])
      end
    end
  end

private

def save_competence
    @competence = Competence.find(params[:competence])
    return false if @competence.blank?
    @human.competence = @competence
    @human.save
  end

  def save_education
    valid_education = Course.valid_education?(course_param,
                                              year_param)
    return false unless valid_education
    @human.course = Course.find_by(code: course_param)
    @human.study_year = year_param
    @human.save
  end

  def save_team
    valid_team = Team.find(team_param).available_team?(@human.competence)
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

  def send_members
    @human = Human.find_by(uuid: uuid_param) if !uuid_param.blank?
    team = @human.team
    humen = team.humen
    humen.each do |human|
      if human.team_id == team.id
        @list_of_emailaddresses = @human.email
        require('pry')
        binding.pry
    NewTeamMember.new_member_email(@human).deliver_later
        end
      end
    end

  def course_param
    params.permit("course")["course"]
  end

  def year_param
    params.permit("year")["year"].to_i
  end

  def competence_param
    params.permit("competence")["competence"].to_i
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
