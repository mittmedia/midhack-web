namespace :supermailer do
  desc "TODO"
  task all: :environment do
    puts 'sending mails now'
    @human = Human.where.not(email: nil).first
    puts 'sending confirm mail now'
    ConfirmationMailer.confirmation_email(@human).deliver_now
    puts 'sending waitlist mail now'
    ConfirmationMailer.waitlist_confirmation_email(@human).deliver_now
    puts 'sending waitlist mail now'
    ConfirmationMailer.deregistration_confirmation_email(@human).deliver_now
    puts 'sending waitlist mail now'
    list = []
    list.push([@human.email, @human.competence.name])
    TeamMailer.new_member_email(@human, list).deliver_now
  end
end
