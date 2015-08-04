class AddTeamToHumen < ActiveRecord::Migration
  def change
    add_reference :humen, :team, index: true
    add_foreign_key :humen, :teams
  end
end
