require 'rails_helper'

describe "A guest user visits root path" do
  scenario "and redirected to login" do

    visit root_path

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Login")
    expect(page).to have_content("Create an Account")
  end
end
