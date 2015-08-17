class RemoveCompetenceFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :competence
  end
end
