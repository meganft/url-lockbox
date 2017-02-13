require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = User.create(name: "Megan", email: "megan@megan.com", password: "password")
    link = user.links.create(url:"https://turing.io", title:"Turing")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"

    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    within('.link .mark-as-read') do
      click_button "Mark as Read"
    end

    # expect(link.read).to eq(true)
    within('.link .read-status') do
      expect(page).to have_text("true")
    end

  end
end
