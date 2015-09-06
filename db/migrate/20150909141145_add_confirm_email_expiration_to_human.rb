class AddConfirmEmailExpirationToHuman < ActiveRecord::Migration
  def change
    add_column :humen, :confirm_email_expire_at, :datetime
  end
end
