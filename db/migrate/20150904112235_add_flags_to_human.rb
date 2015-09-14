class AddFlagsToHuman < ActiveRecord::Migration
  def self.up
    add_column :humen, :signed_up, :boolean, default: false
    add_column :humen, :welcome_email_sent, :boolean, default: false

    puts 'After migration human runner'
    Human.where.not(course_id: nil, team_id: nil, competence_id: nil, email: nil).each do |human|
      if human.update(signed_up: true, welcome_email_sent: true)
        puts "Updating #{human.email}"
      end
    end
  end

  def self.down
    remove_column :humen, :signed_up, :boolean
    remove_column :humen, :welcome_email_sent, :boolean
  end
end
