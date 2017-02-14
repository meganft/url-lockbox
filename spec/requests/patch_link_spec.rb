require 'rails_helper'

describe "PATCH /links", type: :request do
  it "creates a read instance" do
    link = Link.create(url:"https://turing.io", title:"Turing")

    patch "/api/v1/links/#{link.id}", link: { read: true }

    expect(response).to be_success
  end
end
