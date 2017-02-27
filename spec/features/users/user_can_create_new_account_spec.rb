require 'rails_helper'

describe "A user visits signup page" do
  it "and they can create an account with all information" do
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

  it "and they cannot create an account without a password" do
    visit new_user_path

    fill_in "user[email]", with: "email@email.com"
    fill_in "user[password_confirmation]", with: "password"

    click_on "Create An Account!"

    expect(page).to have_content("Password can't be blank")
  end

  it "and they cannot create an account without a password confirmation" do
    visit new_user_path

    fill_in "user[email]", with: "email@email.com"
    fill_in "user[password]", with: "password"

    click_on "Create An Account!"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it "and they cannot create an account if password doesn't match password confirmation" do
    visit new_user_path

    fill_in "user[email]", with: "email@email.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "otherpassword"

    click_on "Create An Account!"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

end
