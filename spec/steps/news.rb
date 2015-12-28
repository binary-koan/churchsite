require_relative "authentication"
require_relative "pages"

module Steps
  module News
    include Authentication
    include Pages

    def create_news_page
      create_page type: "News", title: "News"
    end

    def edit_news_page_part(selector)
      visit "/news"
      start_editing

      within(:css, selector) do
        yield

        click_button "Save"
      end
    end

    def add_news_item(title:, content: "All welcome", date: "today")
      edit_news_page_part("#new_news_item") do
        fill_in "Title", with: title
        fill_in "Content", with: content
        fill_in "Date", with: date
      end
    end

    def change_announcement(announcement)
      visit "/news"
      start_editing

      within ".edit_option", visible: false do
        fill_in "Announcement", with: announcement, visible: false
        click_button "Save", visible: false
      end
    end
  end
end
