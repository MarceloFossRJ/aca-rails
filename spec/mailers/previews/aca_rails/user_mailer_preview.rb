module AcaRails
  # Preview all emails at http://localhost:3000/rails/mailers/aca_rails/user_mailer
  class UserMailerPreview < ActionMailer::Preview

    # Preview this email at http://localhost:3000/rails/mailers/aca_rails/user_mailer/password_reset
    def password_reset
      UserMailerMailer.password_reset
    end

  end
end
