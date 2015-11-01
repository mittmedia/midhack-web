class AddImagePathToDataEntry < ActiveRecord::Migration
  def change
    add_column :data_entries, :image_path, :string
  end
end
