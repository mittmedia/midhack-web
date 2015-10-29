class CreateDataEntries < ActiveRecord::Migration
  def change
    create_table :data_entries do |t|
      t.string :url
      t.string :heading
      t.text :summary
      t.integer :priority
      t.references :data_category, index: true

      t.timestamps null: false
    end
    add_foreign_key :data_entries, :data_categories
  end
end
