require_relative "authentication"
require_relative "pages"

module Steps
  module Homepage
    include Authentication
    include Pages

    def create_homepage
      create_page type: "Homepage", title: "Home"
    end

    def edit_homepage_section(link_title)
      start_editing

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
