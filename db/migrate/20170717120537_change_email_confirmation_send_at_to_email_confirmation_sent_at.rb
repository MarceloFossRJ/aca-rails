class ChangeEmailConfirmationSendAtToEmailConfirmationSentAt < ActiveRecord::Migration[5.0]
  def change
    rename_column :aca_rails_users, :email_confirmation_send_at, :email_confirmation_sent_at
    rename_column :aca_rails_users, :welcome_mail_send_at, :welcome_mail_sent_at
  end
end
