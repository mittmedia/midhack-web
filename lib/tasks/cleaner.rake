namespace :cleaner do
  desc "TODO"
  task registrations: :environment do
    puts 'starting to delete all humans in database'
    puts 'humans to be deleted:'
    Human.all.each do |human|
      puts "- #{human.email}"
    end
    puts 'starting now'
    Human.delete_all
    puts 'humans and waitlists purged'
    puts 'goodbye'
  end

end
