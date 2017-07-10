class AddIsBlockedToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :aca_rails_users, :is_locked, :boolean
  end
end
