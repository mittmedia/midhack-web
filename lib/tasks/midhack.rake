namespace :midhack do
  desc "Expires humen who has not verified their email adress within set time"
  task expire_unverified_members: :environment do
    Human.where(signed_up: true).where.not(email_confirmed: false).each do |h|
      expire_time = Rails.configuration.midhack_signup_closed
      if h.confirm_email_expiration > expire_time
        h.update(signed_up: false,
                 confirm_email_expire_at: nil,
                 email_confirmed: false,
                 email_confirmation_hash: nil,
                 welcome_email_sent: false)
        EmailConfirmationExpirationMailer.time_expired(h).deliver_later
      end
    end
  end
end
