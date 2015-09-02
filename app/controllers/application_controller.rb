class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  private

  ############################
  ### LOCALE ENDPOINTS
  ############################
  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').first
    parsed_second_locale = request.host.split('.')[1]
    available_locales = I18n.available_locales.map(&:to_s)
    available_locales.include?(parsed_locale) ? parsed_locale: nil ||
      available_locales.include?(parsed_second_locale) ?
      parsed_second_locale : nil
  end


end
