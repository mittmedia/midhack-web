class CreateDataCategories < ActiveRecord::Migration
  def change
    create_table :data_categories do |t|
      t.string :slug
      t.integer :priority

      t.timestamps null: false
    end
  end
end
