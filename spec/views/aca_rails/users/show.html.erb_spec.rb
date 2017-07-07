require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :login => "Login",
      :email => "Email",
      :password_digest => "Password Digest",
      :is_admin => false,
      :is_active => false,
      :last_ip => "Last Ip",
      :login_attempts => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Login/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Last Ip/)
    expect(rendered).to match(/2/)
  end
end
