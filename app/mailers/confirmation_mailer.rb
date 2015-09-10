class ConfirmationMailer < ApplicationMailer
  def confirmation_email(human)
    @url = receipt_url(uuid: human.uuid)
    @unsubscribe_url = quit_url(uuid: human.uuid)
    @team_name = human.team.name
    @confirm_email_expire_at = human.confirm_email_expire_at
    @confirm_email_url = confirm_email_url(
      uuid: human.uuid,
      digest: human.email_confirmation_hash
    )
    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Registration Confirmation"}')
    human.locale = Rails.configuration.i18n.default_locale if human.locale.blank?
    I18n.with_locale(human.locale) do
      mail(to: human.email, subject: t('.registered'))
    end
  end

  def waitlist_confirmation_email(human)
    @url = receipt_url(uuid: human.uuid)
    @unsubscribe_url = quit_url(uuid: human.uuid)
    @human = human
    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Waitlist Confirmation"}')
    human.locale = Rails.configuration.i18n.default_locale if human.locale.blank?
    I18n.with_locale(human.locale) do
      mail(to: human.email, subject: t('.waitinglist'))
    end
  end

  def deregistration_confirmation_email(human)
    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Deregistration Confirmation"}')
    human.locale = Rails.configuration.i18n.default_locale if human.locale.blank?
    I18n.with_locale(human.locale) do
      mail(to: human.email, subject: t('.deregistration'))
    end
  end
end
