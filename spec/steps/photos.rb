require_relative "authentication"
require_relative "pages"

module Steps
  module Photos
    include Authentication
    include Pages

    def create_photos_page
      create_page type: "Photos", title: "Galleries"
    end

    def create_gallery(name, image:)
      visit "/galleries"
      start_editing

      click_link "Add gallery"

      fill_in "Name", with: name
      fill_in "Caption", with: image[:caption]
      attach_file "Image", image[:file_path]

      click_button "Save"
    end

    def add_photo_to_gallery(gallery, caption:, file_path:)
      visit "/galleries"

      click_link gallery
      click_link "Add photo"

      fill_in "Caption", with: caption
      attach_file "Image", file_path

      click_button "Save"
    end
  end
end
