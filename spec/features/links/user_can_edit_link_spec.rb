require 'rails_helper'

describe "A logged in user visits links index page" do
  it "and they can update a link" do
    user = User.create(email: "megan@example.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    link = user.links.create(url: "https://turing.io", title: "Turing Website")

    visit edit_link_path(link)

    fill_in "link[title]", with: "New Title"

    click_on "Update Link"

    expect(page).to have_content("Successfully updated this link!")
    expect(current_path).to eq(links_path)
  end
end
