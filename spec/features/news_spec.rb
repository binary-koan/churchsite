require "rails_helper"
require "steps/authentication"
require "steps/news"

RSpec.feature "News", type: :feature do
  include Steps::Authentication
  include Steps::News

  before do
    login
    create_news_page
  end

  scenario "Adding a news item for this week" do
    add_news_item title: "Service", content: "Advent begins", date: "this sunday"

    expect(page).to have_text /Sunday \d+/
    expect(page).to have_text "ServiceAdvent begins"
  end

  scenario "Adding a news item for a different week" do
  end

  scenario "Editing a news item" do
  end

  scenario "Deleting a news item" do
  end

  scenario "Editing the sitewide announcement" do
  end
end
