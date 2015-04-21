class AddUuidToHuman < ActiveRecord::Migration
  def change
    add_column :humen, :uuid, :string
  end
end
