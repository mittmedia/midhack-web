class ChangeOccupationForHuman < ActiveRecord::Migration
  def change
    remove_column :humen, :occupation, :string
    add_column :humen, :study_year, :integer
    add_column :humen, :course, :integer, default: 0
    add_column :humen, :institution, :integer, default: 0
  end
end
