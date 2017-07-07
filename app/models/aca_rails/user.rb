module AcaRails
  class User < ApplicationRecord
    has_paper_trail class_name: 'AcaRails::UserVersion'
    #has_secure_password

  end
end
