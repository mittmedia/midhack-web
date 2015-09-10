class RemoveCompetenceFromWaitlist < ActiveRecord::Migration
  def change
    remove_reference :waitlists, :competence, index: true
  end
end
