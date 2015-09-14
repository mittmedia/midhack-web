namespace :midhack do
  desc "Expires humen who has not verified their email adress within set time"
  task expire_unverified_members: :environment do
    expire_time = Rails.configuration.midhack_signup_closed
    Human.where(signed_up: true).where.not(email_confirmed: true).each do |h|
      @h = h
      if @h.confirm_email_expire_at > expire_time
        puts "expiring #{@h.email}"
        @h.update(signed_up: false,
                 confirm_email_expire_at: DateTime.parse("2020-01-01 10:00:00 +0100"),
                 email_confirmed: false,
                 email_confirmation_hash: nil,
                 welcome_email_sent: false)
        EmailConfirmationExpirationMailer.time_expired(@h).deliver_later
      end
    end
  end
end
