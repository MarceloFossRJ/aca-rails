class CreateAcaRailsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :aca_rails_users do |t|
      t.string :name
      t.string :login
      t.string :email
      t.string :password_digest
      t.boolean :is_admin
      t.boolean :is_active
      t.datetime :last_login
      t.string :last_ip
      t.integer :login_attempts

      t.timestamps
    end
  end
end
