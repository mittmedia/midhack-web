class AddStudyReferencesToHuman < ActiveRecord::Migration
  def change
    remove_column :humen, :course, :string
    remove_column :humen, :institution, :string
    add_reference :humen, :course, index: true
    add_foreign_key :humen, :courses
  end
end
