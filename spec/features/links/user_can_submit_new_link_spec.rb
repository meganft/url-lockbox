require 'rails_helper'

describe "An authenticated user can submit new link" do
  it "and they can create it with a valid url" do
    user = User.create(name: "Megan", email: "megan@megan.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(:css, ".new-link-form") do
      fill_in "title", with: "New Article to Read"
      fill_in "url", with: "https://www.google.com"
      click_on "Submit Link"
    end

    within(:css, ".links-index") do
      expect(page).to have_content("https://www.google.com")
      expect(page).to have_content("New Article to Read")
    end
  end

  it "and they cannot create it with an invalid url" do
    user = User.create(name: "Megan", email: "megan@megan.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(:css, ".new-link-form") do
      fill_in "title", with: "New Article to Read"
      fill_in "url", with: "ww.google.com"
      click_on "Submit Link"
    end

    expect(page).to_not have_content("ww.google.com")
    expect(page).to have_content("Url is not a valid URL")
  end
end
