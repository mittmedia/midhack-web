class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
    add_index :institutions, :code, unique: true
  end
end
