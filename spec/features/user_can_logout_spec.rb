require 'rails_helper'

describe "A registered user can logout" do
  it "and they do not see login link" do
    user = User.create(name: "Megan", email: "megan@megan.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
    expect(current_path).to eq(links_path)
  end

  it "and they can successfully logout" do
    user = User.create(name: "Megan", email: "megan@megan.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    click_on "Logout"

    expect(page).to have_content("You have successfully logged out.")

    expect(current_path).to eq(login_path)
  end
end
