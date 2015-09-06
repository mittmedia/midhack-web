class EmailConfirmationExpirationMailer < ApplicationMailer
  def time_expired(human)
    # Sendgrid Categorization
    headers('X-SMTPAPI' => '{"category": "Email Confirmation Time Window Expired "}')
    mail(to: human.email, subject: 'Din tidsfrist har löpt ut')
  end
end
