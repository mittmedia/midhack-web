class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.integer :points
      t.string :name
      t.string :competence
      t.references :institution, index: true

      t.timestamps null: false
    end
    add_index :courses, :code, unique: true
    add_foreign_key :courses, :institutions
  end
end
