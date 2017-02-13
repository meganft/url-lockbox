require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        link = Link.new(url: "https://www.google.com")
        expect(link).to be_invalid
      end
      it "is invalid without a url" do
        link = Link.new(title: "Article on Google")
        expect(link).to be_invalid
      end
    end
    context "valid attributes" do
      it "is calis with all attributes" do
        link = Link.new(url: "https://www.google.com", title: "Article on Google")
        expect(link).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has belongs to a user" do
      link = Link.new(url: "https://www.google.com", title: "Article on Google")
      expect(link).to respond_to(:user)
    end
  end
end
