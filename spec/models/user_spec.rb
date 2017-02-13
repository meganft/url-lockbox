require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        user = User.new(email: "yellow@yellow.com", password: "blue")
        expect(user).to be_invalid
      end

      it "is invalid without a name" do
        user = User.new(name: "Yellow", password: "blue")
        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(name: "Yellow", email: "yellow@yellow.com")
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = User.new(name: "Yellow", email: "yellow@yellow.com", password: "blue")
        expect(user).to be_valid
      end
    end
  end
end
