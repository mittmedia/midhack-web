class EmailConfirmationExpirationMailer < ApplicationMailer
  def time_expired(human)
    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Email Confirmation Time Window Expired "}')
    human.locale = Rails.configuration.i18n.default_locale if human.locale.blank?
    I18n.with_locale(human.locale) do
      mail(to: human.email, subject: t('.subject'))
    end
  end
end
