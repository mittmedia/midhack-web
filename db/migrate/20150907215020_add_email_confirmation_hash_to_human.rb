class AddEmailConfirmationHashToHuman < ActiveRecord::Migration
  def change
    add_column :humen, :email_confirmation_hash, :text
    add_index :humen, :uuid
    add_index :humen, :signed_up
  end
end
