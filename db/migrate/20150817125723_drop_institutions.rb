class DropInstitutions < ActiveRecord::Migration
  def change
    remove_column :courses, :institution_id
    drop_table :institutions
  end
end
