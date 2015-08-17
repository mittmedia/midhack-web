class MigrateCompetences < ActiveRecord::Migration
  def change
    all_courses = Course.all
    unique_competences = all_courses.map(&:competence).uniq
    unique_competences.each do |competence|
      Competence.create(name: competence)
    end
  end
end
