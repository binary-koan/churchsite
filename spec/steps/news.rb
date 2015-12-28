module Steps
  module News
    def create_news_page
      visit "/pages/new"
      select "News", from: "Type"
      fill_in "Title", with: "News"
      click_button "Save"
    end

    def edit_news_page_part(selector)
      visit "/news"
      click_link "Edit content"

      within(:css, selector) do
        yield

        click_button "Save"
      end
    end

    def add_news_item(title:, content:, date:)
      edit_news_page_part("#new_news_item") do
        fill_in "Title", with: title
        fill_in "Content", with: content
        fill_in "Date", with: date
      end
    end
  end
end
