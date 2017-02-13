require 'rails_helper'

describe "A user can visit the login page" do
  it "and they can login to their account" do
    user = User.create(name: "Megan", email: "megan@megan.com", password: "password")
    visit login_path

    within(:css, ".login-form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    expect(page).to have_content("Successfully logged in as #{user.name}!")
    expect(current_path).to eq(links_path)
  end

  it "and they cannot login with inforrect information" do
    user = User.create(name: "Megan", email: "megan@megan.com", password: "password")
    visit login_path

    within(:css, ".login-form") do
      fill_in "email", with: user.email
      fill_in "password", with: "wrongpassword"
      click_on "Login"
    end

    expect(page).to have_content("Login failed, please try again.")
  end
end
