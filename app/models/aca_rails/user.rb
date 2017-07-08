module AcaRails
  class User < ApplicationRecord
    has_paper_trail class_name: 'AcaRails::UserVersion'
    has_secure_password

    attr_accessor :updating_password

    validates :name, presence: true, length: { in: 3..120 }
    validates :login, presence: true, uniqueness: true, length: { in: 3..25 }
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@]+@[^@]+\z/,
                                                                  message: "Invalid Email" }
    validates :password, presence: true, confirmation: true, length: { in: 4..25 }, on: :create

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

  end
end
