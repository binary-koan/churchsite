require "rails_helper"
require "steps/authentication"
require "steps/pages"

RSpec.feature "Pages", type: :feature do
  include Steps::Authentication
  include Steps::Pages

  background { login }

  scenario "Creating a custom page" do
    create_page type: "Custom", title: "Activities", content: "<p>Nothing yet</p>"

    visit "/activities"
    expect(page).to have_text "Activities"
    expect(page).to have_text "Nothing yet"
  end

  scenario "Changing a page's type" do
    create_page type: "Custom", title: "Activities", content: "<p>Nothing yet</p>"

    visit "/pages"
    click_link "Edit"

    select "News", from: "Page type"
    click_button "Save"

    visit "/activities"
    expect(page).to have_text "Activities"
    expect(page).to have_text "News"
  end

  scenario "Editing a page" do
    create_page type: "Custom", title: "Activities", content: "<p>Nothing yet</p>"

    visit "/pages"
    click_link "Edit"

    fill_in "Title", with: "Activities 2"
    click_button "Save"

    visit "/activities-2"
    expect(page).to have_text "Activities 2"
    expect(page).to have_text "Nothing yet"
  end

  scenario "Rearranging pages" do
    #TODO something with javascript?
  end

  scenario "Deleting a page" do
    create_page type: "Custom", title: "Activities", content: "<p>Nothing yet</p>"

    visit "/pages"
    click_link "Delete"

    expect { visit "/activities" }.to raise_error Mongoid::Errors::DocumentNotFound
  end

  scenario "Grouping pages in a collection" do
    #TODO
  end

  scenario "Deleting a collection" do
    #TODO
  end
end
