class CreateHumen < ActiveRecord::Migration
  def change
    create_table :humen do |t|
      t.string :name
      t.string :occupation
      t.string :email
      t.string :knowledge
      t.string :social
      t.string :news
      t.string :phoneos

      t.timestamps null: false
    end
  end
end
