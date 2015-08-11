class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code, index: true
      t.integer :points
      t.string :name
      t.string :competence
      t.belongs_to :institution, index: true
    end
  end
end
