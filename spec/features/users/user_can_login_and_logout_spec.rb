require 'rails_helper'

describe "A user visits login page" do
  it "and they can login to their account" do
    user = User.create(email: "megan@example.com", password: "password")

    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password

    click_on "Submit"

    expect(page).to have_content("Successfully logged in!")
    expect(current_path).to eq(links_path)

  end
end
