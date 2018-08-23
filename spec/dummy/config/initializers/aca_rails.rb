AcaRails.setup do |config|
  config.app_name = "Dummy Application"
  config.records_per_page = 10
  config.number_wrong_login_attempts = 5
  config.unlock_account_per_time = true
  config.minutes_account_blocked = 60
  config.user_can_signup = true
  config.user_can_inactivate_account = true
  config.user_can_delete_account = false
  config.user_can_have_account_deleted = true
  config.expire_session_per_time = true
  config.minutes_to_expire_session = 60
  config.use_forgotten_password = true
  config.default_from_email = "admin@aca_rails.com"
  config.use_remember_me = true
  config.send_welcome_email = true
  config.user_confirm_signup_by_email = true
  config.hours_to_expire_signup_confirmation = 48
  config.login_title = "Aca-Rails Login"
end
