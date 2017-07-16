class AddIsEmailConfirmedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :aca_rails_users, :is_email_confirmed, :boolean
  end
end
