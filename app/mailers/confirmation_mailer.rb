class ConfirmationMailer < ApplicationMailer
  def confirmation_email(human)
    @human = human
    @url = receipt_url(uuid: human.uuid)
    @unsubscribe_url = ''
    @team_name = human.team.name
    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Confirmation"}')
    mail(to: @human.email, subject: 'Registration for Midhack')
  end
end
