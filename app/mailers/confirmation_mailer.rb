class ConfirmationMailer < ApplicationMailer
  def confirmation_email(human)
    @human = human
    @url = receipt_url(uuid: human.uuid)
    mail(to: @human.email, subject: 'Du är anmäld till Midhack.')
  end
end
