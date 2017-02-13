require 'rails_helper'

describe "An authenticated user can see links index" do
  it "and they see their own links only" do
    user = User.create(name: "Megan", email: "megan@megan.com", password: "password")
    user_2 = User.create(name: "Bob", email: "bob@bob.com", password: "password")
    link_1 = user.links.create(url: "https://www.google.com", title: "Google article")
    link_2 = user.links.create(url: "https://www.facebook.com", title: "Facebook")
    link_3 = user_2.links.create(url: "https://www.weather.com", title: "Weather")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    expect(page).to have_content(link_1.title)
    expect(page).to have_content(link_1.url)
    expect(page).to have_content(link_2.title)
    expect(page).to have_content(link_2.url)
    expect(page).to_not have_content(link_3.title)
    expect(page).to_not have_content(link_3.url)
  end
end
