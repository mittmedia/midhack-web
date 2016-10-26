class RegistrationController < ApplicationController
  before_action :redirect_if_application_date_expired
  def redirect_if_application_date_expired
    return redirect_to :signup_closed if application_date_expired?
  end

  def signup
    @url = Rails.configuration.registration_form_url
  end

  def signup_closed
  end
end
