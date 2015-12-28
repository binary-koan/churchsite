module Steps
  module Homepage
    def create_homepage
      visit "/pages/new"
      select "Homepage", from: "Type"
      fill_in "Title", with: "Home"
      click_button "Save"
    end

    def edit_homepage_section(link_title)
      if page.has_link?("Edit content")
        click_link "Edit content"
      end

      click_link link_title
      yield
      click_button "Save"
    end

    def add_church(
        name: "Lincoln",
        services: "Sundays 10am",
        address: "Near Rolleston",
        map_address: "Lincoln")

      edit_homepage_section "Add church" do
        fill_in "Name", with: name
        fill_in "services", with: services
        fill_in "Address", with: address
        fill_in "Map address", with: map_address
      end
    end
  end
end
