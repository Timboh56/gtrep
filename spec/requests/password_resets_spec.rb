require 'spec_helper'

describe "PasswordResets" do
  it "emails user when request password reset" do
    user = Factory(:user)
    visit login_path
    click_link "password"
    fill_in "email", :with => user.email
    click_button "Reset Password"
end
