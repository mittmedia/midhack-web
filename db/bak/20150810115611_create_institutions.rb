class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :code, index: true
      t.string :name
    end
  end
end
