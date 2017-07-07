require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :login => "Login",
        :email => "Email",
        :password_digest => "Password Digest",
        :is_admin => false,
        :is_active => false,
        :last_ip => "Last Ip",
        :login_attempts => 2
      ),
      User.create!(
        :name => "Name",
        :login => "Login",
        :email => "Email",
        :password_digest => "Password Digest",
        :is_admin => false,
        :is_active => false,
        :last_ip => "Last Ip",
        :login_attempts => 2
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Last Ip".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
