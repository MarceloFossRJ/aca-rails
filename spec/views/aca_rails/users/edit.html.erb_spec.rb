require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :login => "MyString",
      :email => "MyString",
      :password_digest => "MyString",
      :is_admin => false,
      :is_active => false,
      :last_ip => "MyString",
      :login_attempts => 1
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_login[name=?]", "user[login]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_password_digest[name=?]", "user[password_digest]"

      assert_select "input#user_is_admin[name=?]", "user[is_admin]"

      assert_select "input#user_is_active[name=?]", "user[is_active]"

      assert_select "input#user_last_ip[name=?]", "user[last_ip]"

      assert_select "input#user_login_attempts[name=?]", "user[login_attempts]"
    end
  end
end
