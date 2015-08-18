class AddCompetenceToHuman < ActiveRecord::Migration
  def change
    add_reference :humen, :competence, index: true
    add_foreign_key :humen, :competences
  end
end
