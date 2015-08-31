class ConfirmationMailer < ApplicationMailer
  def confirmation_email(human)
    @human = human
    @url = receipt_url(uuid: human.uuid)
    @unsubscribe_url = quit_url(uuid: @human.uuid)
    @team_name = human.team.name
    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Registration Confirmation"}')
    mail(to: @human.email, subject: 'Registration for Midhack')
  end
  def waitlist_confirmation_email(human)
    @human = human
    @url = receipt_url(uuid: human.uuid)
    @unsubscribe_url = quit_url(uuid: @human.uuid)
    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Waitlist Confirmation"}')
    mail(to: @human.email, subject: 'Registration for Midhack waitlist')
  end
end
