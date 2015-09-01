class OnboarderController < ApplicationController
  before_action :set_human
  before_action :valid_education, only: [
    :choose_competence,
    :save_competence,
    :choose_team,
    :automatic_selection,
    :save_team,
    :fill_email,
    :save_email,
    :confirmation,
    :receipt
  ]
  before_action :valid_competence, only: [
    :choose_team,
    :automatic_selection,
    :save_team,
    :fill_email,
    :save_email,
    :present_email,
    :confirmation,
    :receipt
  ]
  before_action :valid_team, only: [
    :fill_email,
    :save_email,
    :confirmation,
    :receipt
  ]
  before_action :valid_signup, only: [:confirmation, :receipt]

  before_action :available_spots, only: [
    :choose_team,
    :automatic_selection,
    :save_team,
    :fill_email,
    :save_email,
    :present_email,
  ]

  #####################
  ### GENERIC ENDPOINTS
  #####################

  def index
  end

  def what
    @signed_up = @human.signed_up?
  end

  def why
    @nr_spots_left = total_nr_of_spots_left
    @signed_up = @human.signed_up?
  end

  def total_nr_of_spots_left
    spots_taken = Human.all.select(&:signed_up?).count
    Rails.configuration.midhack_total_nr_spots - spots_taken
  end

  def ical
    file_path = Rails.root.join('public', 'downloads', 'invite.ics')
    send_file file_path, type: 'text/x-vCalendar', filename: 'invite.ics'
  end

  #######################
  ### EDUCATION ENDPOINTS
  #######################

  def choose_education
    new_human if force_param
    @courses = Course.all
  end

  def save_education
    if course_param.blank? || year_param.blank?
      return redirect_to :choose_education
    end
    valid_edu = Course.valid_education?(course_param, year_param)
    @human.course = Course.find_by(code: course_param)
    @human.study_year = year_param
    return redirect_to :choose_education if !valid_edu || !@human.save
    redirect_to :choose_competence
  end

  ########################
  ### COMPETENCE ENDPOINTS
  ########################

  def choose_competence
    @competences = Competence.all
    render
  end

  def save_competence
    competence = Competence.find(competence_param)
    return redirect_to :choose_competence if competence.blank?
    if @human.update(competence: competence)
      redirect_to :choose_team
    else
      redirect_to :choose_competence
    end
  end

  #########################
  ### TEAM CHOICE ENDPOINTS
  #########################

  def choose_team
    @sorted_teams = Team.sorted_teams(@human.competence, @human.study_year)
    render
  end

  def automatic_selection
    @sorted_teams = Team.sorted_teams(@human.competence, @human.study_year)
    matched_team = @sorted_teams[:available_teams].first
    return redirect_to :waitinglist if matched_team.blank?
    if @human.update(team: matched_team)
      redirect_to :fill_email
    else
      redirect_to :choose_team
    end
  end

  def save_team
    team = Team.find(team_param)
    unless team.available_team? @human.competence
      return redirect_to :reserve_fill_email
    end
    if @human.update(team: team)
      redirect_to :fill_email
    else
      redirect_to :choose_team
    end
  end

  ##############################
  ### EMAIL COLLECTION ENDPOINTS
  ##############################

  def fill_email
  end

  def save_email
    already_signed_up = @human.signed_up?
    return email_not_present unless email_param.present?
    if @human.update!(email: email_param)
      if already_signed_up
        return redirect_to :receipt
      else
        return confirmation
      end
    end
    flash.now[:notice] = I18n.t('validation.check_fields')
    render 'fill_email'
  end

  def reserve_team_spot
   team = Team.find(team_param)
   @human = Human.find_by(uuid: @uuid)
   human= @human
    if Waitlist.create(team: team) && Waitlist.create(human: human)
      redirect_to :reserve_fill_email
    else
      redirect_to :choose_team
    end
  end

  def save_reservation_email
    already_signed_up = @human.signed_up?
    if @human.update(email: email_param)
      if already_signed_up
        return redirect_to :reservation_receipt
      else
        return confirm_reservation
      end
    end
    flash.now[:notice] = t('malformed_email')
    redirect_to :reserve_fill_email
  end

  #################################
  ### SIGNUP CONFIRMATION ENDPOINTS
  #################################

  def confirmation
    inform_other_members
    ConfirmationMailer.confirmation_email(@human).deliver_later
    redirect_to :receipt
  end

  def confirm_reservation
    ConfirmationMailer.waitlist_confirmation_email(@human).deliver_later
    redirect_to :reservation_receipt
  end

  def receipt
    humen = @human.team.humen.select(&:signed_up?)
    @team_member_details = team_member_details(humen)
    @team_name = @human.team.name
    render
  end

  ############################
  ### DEREGISTRATION ENDPOINTS
  ############################

  def quit
    redirect_to root_path unless @human.signed_up?
  end

  def quitting
    @human.team = nil
    return redirect_to :unregistered if @human.save
    redirect_to :back
  end

  def unregistered
  end

  def event_is_full
    Human.all.select(&:signed_up?).count >= 51
  end

private

  def team_member_details(humen)
    list = []
    humen.each do |human|
      list.push([human.email, human.competence.name])
    end
    list
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

  def inform_other_members
    humen = @human.team.humen.select(&:signed_up?)
    humen.delete(@human) # no need to inform self
    tmd = team_member_details(humen)
    humen.each do |human|
      NewTeamMember.new_member_email(human, tmd).deliver_later
    end
  end

  def valid_education
    return redirect_to choose_education_path unless
      @human.present? && @human.course.present?
    b = Course.valid_education? @human.course.code, @human.study_year
    return redirect_to :choose_education unless b
    true
  end

  def valid_competence
    return redirect_to :choose_competence if @human.competence.blank?
    true
  end

  def valid_team
    return redirect_to :choose_team if @human.team.blank?
    true
  end

  def valid_signup
    return redirect_to :fill_email unless @human.signed_up?
    true
  end

  def email_not_present
    flash.now[:notice] = I18n.t('validation.forgot_email')
    render 'fill_email'
  end

   def available_spots
    if event_is_full
      redirect_to reserve_team_spot_path
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
    params[:email]
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
