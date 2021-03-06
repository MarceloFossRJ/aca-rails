module AcaRails
  class User < ApplicationRecord
    has_paper_trail class_name: 'AcaRails::UserVersion'
    has_secure_password
    before_create {generate_token(:auth_token)}
    after_create :send_emails

    attr_accessor :updating_password

    validates :name, presence: true, length: { in: 3..120 }
    validates :login, presence: true, uniqueness: true, length: { in: 3..25 }
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@]+@[^@]+\z/,
                                                                  message: "Invalid Email" }
    validates :password, presence: true, confirmation: true, length: { in: 4..25 }, if: :should_validate_password? #on: :create

    def aca_authenticate(pwd, ip)
      if AcaRails.unlock_account_per_time
        if self.is_locked?
          if Time.now - AcaRails.minutes_account_blocked.minutes > self.locked_at.to_datetime
            self.update_column(:is_locked, false)
          end
        end
      end

      if AcaRails.user_confirm_signup_by_email
        x = AcaRails.hours_to_expire_signup_confirmation.to_i
        if !self.email_confirmation_sent_at.blank?
          if !self.is_email_confirmed? && self.email_confirmation_sent_at < x.hours.ago
            return false
          end
        end
      end

      if self.authenticate(pwd) && self.is_active? && !self.is_locked?
        self.update_column(:last_login, Time.now)
        self.update_column(:last_ip, ip)
        self.update_column(:login_attempts, 0)
        return true
      else
        if (!self.is_locked? || self.is_active)
          increment_login_attempts
        end
        return false
      end
    end

    def increment_login_attempts
      if self.login_attempts
        nl = self.login_attempts.to_i + 1
      else
        nl = 1
      end

      self.update_column(:login_attempts, nl)

      if nl >= AcaRails.number_wrong_login_attempts.to_i
        self.update_column(:is_locked, true)
        self.update_column(:locked_at, Time.now)
      end
    end

    def should_validate_password?
      updating_password || new_record?
    end

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end

    def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
    end

    def send_emails
      if AcaRails.send_welcome_email
        UserMailer.welcome_email(self).deliver
        self.welcome_mail_sent_at = Time.zone.now
        save!
      end
      if AcaRails.user_confirm_signup_by_email
        UserMailer.signup_confirmation(self).deliver
        self.email_confirmation_sent_at = Time.zone.now
        self.is_email_confirmed = false
        save!
      end
    end

    def confirm_email
      if AcaRails.user_confirm_signup_by_email
        self.is_email_confirmed = true
        save!
      end
    end

  end
end
