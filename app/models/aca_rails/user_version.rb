module AcaRails
  class UserVersion < PaperTrail::Version
    self.table_name = :aca_rails_user_versions
    belongs_to :user, foreign_key: :whodunnit ##if using a user table, to record who made the change

  end
end
