require 'rails_helper'

describe "A logged in user sees link to logout on index page" do
  it "and they do not see place to login" do
    user = User.create(email: "megan@example.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
  end

  it "and they can logout of their account" do
    user = User.create(email: "megan@example.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    click_on "Logout"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Successfully logged out.")
  end
end
