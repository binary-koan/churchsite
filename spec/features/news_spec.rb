require "rails_helper"
require "steps/news"

RSpec.feature "News", type: :feature do
  include Steps::News

  background do
    login
    create_news_page
  end

  #TODO These no longer work because news items are loaded with AJAX
  # scenario "Adding a news item for this week" do
  #   add_news_item title: "Service", content: "Advent begins", date: "this sunday"
  # 
  #   expect(page).to have_text /Sunday \d+/
  #   expect(page).to have_text "ServiceAdvent begins"
  # end
  # 
  # scenario "Adding a news item for a different week" do
  #   add_news_item title: "Coffee morning", content: "All welcome", date: "2 weeks ago"
  # 
  #   expect(page).not_to have_text /Monday \d+/
  #   expect(page).not_to have_text "Coffee morning"
  # 
  #   #TODO test going back a week
  # end
  # 
  # scenario "Editing a news item" do
  #   add_news_item title: "Service", content: "Advent begins", date: "this sunday"
  # 
  #   #TODO test JS hides/shows the form
  #   within(".news-editor", visible: false) do
  #     fill_in "Title", with: "Not actually a service", visible: false
  #     click_button "Save", visible: false
  #   end
  # 
  #   expect(page).to have_text /Sunday \d+/
  #   expect(page).to have_text "Not actually a service"
  # end
  # 
  # scenario "Deleting a news item" do
  #   add_news_item title: "Service", content: "Advent begins", date: "this sunday"
  # 
  #   within("#news") { click_link "Delete" }
  # 
  #   expect(page).not_to have_text /Sunday \d+/
  #   expect(page).not_to have_text "ServiceAdvent begins"
  # end

  scenario "Editing the sitewide announcement" do
    change_announcement "This is really important!"

    create_page type: "Homepage", title: "Home"

    visit "/news"
    expect(page).to have_text "This is really important!"
    visit "/"
    expect(page).to have_text "This is really important!"
  end
end
