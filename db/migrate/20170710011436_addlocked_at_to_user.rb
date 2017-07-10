class AddlockedAtToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :aca_rails_users, :locked_at, :datetime
  end
end
