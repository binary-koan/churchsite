module Steps
  module Homepage
    def create_homepage
      visit "/pages/new"
      select "Homepage", from: "Type"
      fill_in "Title", with: "Home"
      click_button "Save"
    end

    def edit_homepage_section(link_title)
      visit "/"
      click_link "Edit content"
      click_link link_title

      yield

      click_button "Save"
    end
  end
end
