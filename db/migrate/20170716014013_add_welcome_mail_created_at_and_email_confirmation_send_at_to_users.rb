class AddWelcomeMailCreatedAtAndEmailConfirmationSendAtToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :aca_rails_users, :welcome_mail_send_at, :datetime
    add_column :aca_rails_users, :email_confirmation_send_at, :datetime
  end
end
