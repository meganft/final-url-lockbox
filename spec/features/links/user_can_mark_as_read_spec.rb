require 'rails_helper'

describe "A logged in user visits links index page" do
  it "and their new link defaults to unread" do
    user = User.create(email: "megan@example.com", password: "password")
    link = user.links.create(url: "https://turing.io", title: "Turing Website")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    expect(link.read).to eq(false)
  end

  it "and they can mark this link as read", :js => :true  do
    user = User.create(email: "megan@example.com", password: "password")
    link = user.links.create(url: "https://turing.io", title: "Turing Website")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_button "Mark as Read"

    visit links_path
  end
end
