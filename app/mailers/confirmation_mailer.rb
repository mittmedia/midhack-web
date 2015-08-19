class ConfirmationMailer < ApplicationMailer
  def confirmation_email(human)
    @human = human
    @url = receipt_url(uuid: human.uuid)
    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Confirmation"}')
    mail(to: @human.email, subject: 'Du är anmäld till Midhack.')
  end
end
