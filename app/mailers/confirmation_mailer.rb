class ConfirmationMailer < ApplicationMailer
  def confirmation_email(human)
    @human = human
    mail(to: @human.email, subject: 'Du är anmäld till Midhack.')
  end
end
