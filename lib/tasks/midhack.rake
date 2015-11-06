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
  desc "Notifies participants that the programme for midhack now is released"
  task programme_released_email: :environment do
    h1 = Human.create(email: 'crew@midhack.se', locale: 'en', signed_up: true)
    h2 = Human.create(email: 'dmu@mittmedia.se', locale: 'sv', signed_up: true)
    humans = Human.where(signed_up: true)
    humans.each do |h|
      @h = h
      InformationMailer.programme(@h).deliver_later
    end
    h1.destroy();
    h2.destroy();
  end
  desc "Notifies participants that the data sources for midhack now is released"
  task data_released_email: :environment do
    h1 = Human.create(email: 'crew@midhack.se', locale: 'en', signed_up: true)
    h2 = Human.create(email: 'dmu@mittmedia.se', locale: 'sv', signed_up: true)
    humans = Human.where(signed_up: true)
    humans.each do |h|
      @h = h
      InformationMailer.data(@h).deliver_later
    end
    h1.destroy();
    h2.destroy();
  end
  desc "Sends out the final information and special food requirements form"
  task final_info_email: :environment do
    h1 = Human.create(email: 'crew@midhack.se', locale: 'en', signed_up: true)
    h2 = Human.create(email: 'dmu@mittmedia.se', locale: 'sv', signed_up: true)
    humans = Human.where(signed_up: true)
    humans.each do |h|
      @h = h
      InformationMailer.final_info(@h).deliver_later
    end
    h1.destroy();
    h2.destroy();
  end
end
