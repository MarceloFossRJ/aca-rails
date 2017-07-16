class AddPasswordResetToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :aca_rails_users, :password_reset_token, :string
    add_column :aca_rails_users, :password_reset_sent_at, :datetime
  end
end
