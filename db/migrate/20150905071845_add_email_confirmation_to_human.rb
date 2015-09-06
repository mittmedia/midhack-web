class AddEmailConfirmationToHuman < ActiveRecord::Migration
  def change
    add_column :humen, :email_confirmed, :boolean, default: false
  end
end
