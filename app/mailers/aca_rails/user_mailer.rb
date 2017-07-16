module AcaRails
  class UserMailer < ::ActionMailer::Base

    default from: AcaRails.default_from_email

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.user_mailer.password_reset.subject
    #
    def password_reset(user)
      @user = user
      mail :to => user.email, :subject => "Reset your password"
    end

    def welcome_email(user)
      @user = user
      mail to: user.email, subject: "Welcome to #{AcaRails.app_name}"
    end

    def signup_confirmation(user)
      @user = user
      mail to: user.email, subject: "#{AcaRails.app_name} signup confirmation"
    end
  end
end
