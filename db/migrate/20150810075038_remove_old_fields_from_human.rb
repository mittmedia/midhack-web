class RemoveOldFieldsFromHuman < ActiveRecord::Migration
  def change
    remove_column :humen, :knowledge, :string
    remove_column :humen, :social, :string
    remove_column :humen, :news, :string
    remove_column :humen, :phoneos, :string
    remove_column :humen, :step, :string
  end
end
