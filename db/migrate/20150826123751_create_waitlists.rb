class CreateWaitlists < ActiveRecord::Migration
  def change
    create_table :waitlists do |t|
      t.references :human, index: true
      t.datetime :spot_offered
      t.references :team, index: true
      t.references :competence, index: true

      t.timestamps null: false
    end
    add_foreign_key :waitlists, :humen
    add_foreign_key :waitlists, :teams
    add_foreign_key :waitlists, :competences
  end
end
