class ConfirmationMailer < ApplicationMailer
  def confirmation_email(human)
    @url = receipt_url(uuid: human.uuid)
    @unsubscribe_url = quit_url(uuid: human.uuid)
    @team_name = human.team.name
    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Registration Confirmation"}')
    mail(to: human.email, subject: 'Registrerad på Midhack')
  end

  def waitlist_confirmation_email(human)
    @url = receipt_url(uuid: human.uuid)
    @unsubscribe_url = quit_url(uuid: human.uuid)
    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Waitlist Confirmation"}')
    mail(to: human.email, subject: 'Registrerad på Midhacks väntelista')
  end

  def deregistration_confirmation_email(human)
    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Deregistration Confirmation"}')
    mail(to: human.email, subject: 'Avanmäld från Midhack')
  end
end
