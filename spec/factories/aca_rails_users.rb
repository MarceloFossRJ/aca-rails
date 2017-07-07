FactoryGirl.define do
  factory :aca_rails_user, class: 'AcaRails::User' do
    name "MyString"
    login "MyString"
    email "MyString"
    password_digest "MyString"
    is_admin false
    is_active false
    last_login "2017-07-06 22:39:38"
    last_ip "MyString"
    login_attempts 1
  end
end
