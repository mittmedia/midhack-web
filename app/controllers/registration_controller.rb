class RegistrationController < ApplicationController
  def signup
    return redirect_to :root if application_date_expired?
    @url = Rails.configuration.registration_form_url
  end
end
