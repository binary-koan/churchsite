require_relative "authentication"
require_relative "pages"

module Steps
  module Sermons
    include Pages
    include Authentication

    def create_sermons_page
      create_page type: "Sermons", title: "From the Minister"
    end

    def add_sermon(title:, introduction:, content:, date:)
      visit "/from-the-minister"
      start_editing
      click_link "Add sermon"

      fill_in "Date", with: date
      fill_in "Title", with: title
      fill_in "Introduction", with: introduction
      fill_in "Content", with: content
      click_button "Save"
    end
  end
end
