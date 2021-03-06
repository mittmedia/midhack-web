class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_human
  before_filter :set_locale
  before_filter :setup_vars

  private

  def setup_vars
    @signed_up = @human.signed_up
    @on_waiting_list = @human.on_waitlist?
    @application_date_expired = application_date_expired?
  end

  def get_human(uuid)
    Human.find_by(uuid: uuid)
  end

  def set_human
    @human = nil
    @human = get_human(uuid_param) unless uuid_param.blank?
    @human = get_human(cookies[:uuid]) if @human.blank?
    cookies[:uuid] = { value: @human.uuid, expires: 1.year.from_now } unless @human.blank?
    new_human if @human.blank?
  end

  def new_human
    @human = Human.create!
    cookies[:uuid] = { value: @human.uuid, expires: 1.year.from_now }
  end

  def uuid_param
    params.permit("uuid")["uuid"]
  end

  def application_date_expired?
    now = DateTime.now()
    closing_time = Rails.configuration.midhack_signup_closed
    now > closing_time
  end

  ############################
  ### LOCALE ENDPOINTS
  ############################
   def set_locale
    available = I18n.available_locales
    if @human.locale.blank?
      @human.locale = http_accept_language.compatible_language_from(available)
    end
    locale_param = params[:locale]
    if locale_param.present? && available.include?(locale_param.to_sym)
      @human.locale = locale_param
    end
    @human.save if @human.changed?
    I18n.locale = @human.locale
  end
end
