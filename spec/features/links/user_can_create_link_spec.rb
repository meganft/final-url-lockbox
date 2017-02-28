require 'rails_helper'

describe "A logged in user visits links index page", :js => :true   do
  it "and they can create a create a new link" do
    user = User.create(email: "megan@example.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(:css, "#new-link") do
      fill_in "link-title", with: "New title for a link"
      fill_in "link-url", with: "https://www.google.com"
      click_on "Add Link"
    end

    visit links_path

    within(:css, "#links-list") do
      expect(page).to have_content("https://www.google.com")
      expect(page).to have_content("New title for a link")
    end
  end

  it "and they cannot create a link with an invalid url" do
    user = User.create(email: "megan@example.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(:css, "#new-link") do
      fill_in "link-title", with: "New title for a link"
      fill_in "link-url", with: "www.bad.com"
      find_button("Add Link").trigger('click')
    end

    expect(page).to_not have_content("New title for a link")
  end

  it "and they cannot create a link without a title" do
    user = User.create(email: "megan@example.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(:css, "#new-link") do
      fill_in "link-url", with: "https://www.google.com"
      click_on "Add Link"
    end

    expect(page).to_not have_content("https://www.google.com")
  end

  it "and they cannot create a link without a url" do
    user = User.create(email: "megan@example.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(:css, "#new-link") do
      fill_in "link-title", with: "New title for a link"
      click_on "Add Link"
    end

    expect(page).to_not have_content("New title for a link")
  end
end
