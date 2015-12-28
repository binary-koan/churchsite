module Steps
  module Pages
    def create_page(title:, type:, content: nil)
      visit "/pages/new"
      select type, from: "Page type"
      fill_in "Title", with: title

      if content
        fill_in "Page content", with: content
      end

      click_button "Save"
    end
  end
end
