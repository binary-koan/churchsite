module Steps
  module News
    def edit_news_page_part(selector)
      visit "/news"
      click_link "Edit content"

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
      click_link "Edit content"

      within ".edit_option", visible: false do
        fill_in "Announcement", with: announcement, visible: false
        click_button "Save", visible: false
      end
    end
  end
end
