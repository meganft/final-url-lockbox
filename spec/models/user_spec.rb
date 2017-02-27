require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without an email" do
        user = User.new(password: "blue")
        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(email: "email@email.com")
        expect(user).to be_invalid
      end

    end

    # context "valid attributes" do
    #   it "is valid with all attributes" do
    #     user = User.new(name: "Yellow", email: "yellow@yellow.com", password: "blue")
    #     expect(user).to be_valid
    #   end
    # end

  #   context "uniqueness" do
  #     it "has a unique email" do
  #       User.create(name: "Bob", email: "yellow@yellow.com", password: "blue")
  #       user = User.new(name: "Steve", email: "yellow@yellow.com", password: "red")
  #       expect(user).to be_invalid
  #     end
  #   end
  # end
  # describe "relationships" do
  #   it "has many links" do
  #     user = User.create(name: "Bob", email: "yellow@yellow.com", password: "blue")
  #     expect(user).to respond_to(:links)
  #   end
  # end
end
