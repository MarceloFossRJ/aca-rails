class AddAuthTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :aca_rails_users, :auth_token, :string
  end
end
