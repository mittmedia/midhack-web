class AddLocaleToHuman < ActiveRecord::Migration
  def change
    add_column :humen, :locale, :string
  end
end
