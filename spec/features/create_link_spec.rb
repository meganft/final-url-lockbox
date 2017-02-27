require "rails_helper"

RSpec.xdescribe "can create links", :js => :true do
  scenario "Create a new link" do
    visit "/"
    fill_in "Title:", :with => "Turing"
    fill_in "URL:", :with => "http://turing.io"
    click_on "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end

  end
end
