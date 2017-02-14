require 'rails_helper'

describe "An authenticated user can go to edit link path" do
  it "and they can update the link" do
    user = User.create(name: "Megan", email: "megan@megan.com", password: "password")
    link = user.links.create(url: "https://www.google.com", title: "Google article")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_link_path(link)

    within(:css, ".update-link-form") do
    fill_in "link[title]", with: "This is a new title"
    end
    #
    # expect(current_path).to eq(links_path)
    # expect(page).to have_content("Successfully updated this link!")
  end
end
