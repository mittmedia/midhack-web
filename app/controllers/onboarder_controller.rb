class OnboarderController < ApplicationController
  include OnboarderHelper

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
    :save_email
  ]

  before_action :available_competence, only:[
    :choose_team,
    :automatic_selection,
    :save_team,
    :fill_email,
    :save_email
  ]

  #####################
  ### GENERIC ENDPOINTS
  #####################

  def index
  end

  def policy
  end

  def what
    @signed_up = @human.signed_up
    @on_waiting_list = @human.on_waitlist?
  end

  def why
    @nr_spots_left = total_nr_of_spots_left
    @signed_up = @human.signed_up
    @on_waiting_list = @human.on_waitlist?
  end

  def total_nr_of_spots_left
    spots_taken = Human.all.select(&:signed_up).count
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
    session[:automatic_selection] = true
    @sorted_teams = Team.sorted_teams(@human.competence, @human.study_year)
    matched_team = @sorted_teams[:available_teams].first
    return redirect_to :reserve_fill_email if matched_team.blank?
    if @human.update(team: matched_team)
      redirect_to :fill_email
    else
      redirect_to :choose_team
    end
  end

  def save_team
    session[:automatic_selection] = false
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

  def reserve_team_spot
    team = Team.find(team_param)
    if team.present?
      @human.update(team: team)
      redirect_to :reserve_fill_email
    else
      redirect_to :choose_team
    end
  end

  def save_email
    already_signed_up = @human.signed_up
    return email_not_present('save') unless email_param.present?
    begin
      if register_email email: email_param, signed_up: true
        if already_signed_up
          return redirect_to :receipt
        else
          return confirmation
        end
      end
    rescue ActiveRecord::RecordInvalid => invalid
      message = ''
      invalid.record.errors.messages.first.second.each do |m|
        message = message + "#{m}\n"
      end
      flash.now[:notice] = message
      return render 'fill_email'
    end
    flash.now[:notice] = I18n.t('validation.check_fields')
    render 'fill_email'
  end

  def save_reservation_email
    return email_not_present('reserve') unless email_param.present?
    begin
      if register_email email: email_param, signed_up: false
        Waitlist.create(team: @human.team, human: @human)
        return confirm_reservation
      end
    rescue ActiveRecord::RecordInvalid => invalid
      message = ''
      invalid.record.errors.messages.first.second.each do |m|
        message = message  + "#{m}\n"
      end
      flash.now[:notice] = message
      return render 'reserve_fill_email'
    end
    flash.now[:notice] = I18n.t('validation.check_fields')
    render 'reserve_fill_email'
  end

  def register_email(args)
    expiration_time = calculate_expiration_time
    confirm_hash = @human.generate_email_confirmation_hash
    @human.update!(
      email: args[:email],
      signed_up: args[:signed_up],
      confirm_email_expire_at: expiration_time,
      email_confirmation_hash: confirm_hash
    )
  end

  #################################
  ### SIGNUP CONFIRMATION ENDPOINTS
  #################################

  def confirmation
    inform_other_members_of_new_team_mate
    ConfirmationMailer.confirmation_email(@human).deliver_later
    redirect_to :receipt
  end

  def confirm_reservation
    ConfirmationMailer.waitlist_confirmation_email(@human).deliver_later
    redirect_to :reservation_receipt
  end

  def confirm_email
    if @human.generate_email_confirmation_hash == digest_param
      @human.update(email_confirmed: true)
      flash.now[:notice] = I18n.t('validation.confirmed_email')
    else
      flash.now[:notice] = I18n.t('validation.confirmed_email_fail')
    end
    redirect_to :receipt
  end

  def reservation_receipt
  end

  def receipt
    humen = @human.team.humen.select(&:signed_up)
    @team_member_details = team_member_details(humen)
    @team_name = @human.team.name
    render
  end

  ############################
  ### DEREGISTRATION ENDPOINTS
  ############################
  def quit
    redirect_to root_path unless @human.signed_up
  end

  def quitting
    return redirect_to :unregistered if unregister_human
    redirect_to :back
  end

  def unregister_human
    team = @human.team
    if team.present?
      if @human.update(signed_up: false)
        inform_other_members_of_lost_team_mate(team)
        mail = ConfirmationMailer.deregistration_confirmation_email @human
        mail.deliver_later
        return true
      end
    end
    false
  end

  def unregistered
  end

  ##########################
  ### FILLED SPOTS ENDPOINTS
  ##########################
  def event_is_full
    max_spots = Rails.configuration.midhack_total_nr_spots
    Human.all.select(&:signed_up).count > max_spots
  end

  def competence_is_full
    competence_count = @human.competence(&:signed_up)
    competence_count == 0
  end

private

  def team_member_details(humen)
    list = []
    default_locale = Rails.configuration.i18n.default_locale
    humen.each do |human|
      human.locale ||= default_locale
      list.push({
        email: human.email,
        competence: human.competence.name,
        locale: human.locale
      })
    end
    list
  end

  def other_members
    humen
  end

  def inform_other_members_of_new_team_mate
    humen = @human.team.humen.select(&:signed_up)
    tmd = team_member_details(humen)
    humen.delete(@human) # no need to inform self
    return if humen.blank?
    humen.each do |human|
      I18n.with_locale(human.locale) do
        TeamMailer.new_member_email(human, tmd, @human).deliver_later
      end
    end
  end

  def inform_other_members_of_lost_team_mate(team)
    humen = team.humen.select(&:signed_up)
    return if humen.blank?
    tmd = team_member_details(humen)
    humen.each do |human|
      I18n.with_locale(human.locale) do
        TeamMailer.lost_member_email(human, tmd, @human).deliver_later
      end
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
    return redirect_to :fill_email unless @human.signed_up
    true
  end

  def email_not_present(save_or_reserve)
    flash.now[:notice] = I18n.t('validation.forgot_email')
    return render 'fill_email' if save_or_reserve == 'save'
    render 'reserve_fill_email'
    false
  end

  def available_spots
    if event_is_full
      redirect_to reserve_fill_email_path
    end
  end

  def available_competence
    if competence_is_full
      redirect_to reserve_fill_email_path
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

  def digest_param
    params.permit("digest")["digest"]
  end

  def force_param
    force = params.permit("force")["force"]
    return false if force.blank?
    force.upcase == 'TRUE'
  end
end
