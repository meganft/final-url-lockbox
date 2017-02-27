require 'rails_helper'

describe "A user visits new user page" do
  it "and they can create an account" do
    visit new_user_path

    fill_in "user[email]", with: "email@email.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"

    click_on "Create An Account!"

    expect(page).to have_content("Successfully made an account!")
    expect(current_path).to eq(links_path)
  end

  it "and they cannot create an account without an email" do
    visit new_user_path

    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"

    click_on "Create An Account!"

    expect(page).to have_content("Email can't be blank")
  end

end
