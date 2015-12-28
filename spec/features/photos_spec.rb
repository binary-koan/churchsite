require "rails_helper"
require "steps/photos"

RSpec.feature "Photos", type: :feature do
  include Steps::Photos

  background do
    login
    create_photos_page
  end

  scenario "Creating a gallery with one photo" do
    create_gallery "Church photos", image: {
      caption: "Church exterior",
      file_path: Rails.root.join("spec/features/files/test.png")
    }

    expect(current_path).to eq "/photos/gallery"
    expect(page).to have_css "a[title='Church exterior']"
    expect(page).to have_css "img[alt='Church exterior'][src^='/uploads/photo/image/']"

    visit "/galleries"
    expect(page).to have_link "Church photos"
  end

  scenario "Adding a photo to an existing gallery" do
    create_gallery "Church photos", image: {
      caption: "Church exterior",
      file_path: Rails.root.join("spec/features/files/test.png")
    }

    add_photo_to_gallery "Church photos",
      caption: "Church interior",
      file_path: Rails.root.join("spec/features/files/test.png")

    expect(page).to have_css "a[title='Church exterior']"
    expect(page).to have_css "img[alt='Church exterior'][src^='/uploads/photo/image/']"
    expect(page).to have_css "a[title='Church interior']"
    expect(page).to have_css "img[alt='Church interior'][src^='/uploads/photo/image/']"
  end

  scenario "Rearranging photos in a gallery" do
    #TODO something with javascript ...
  end

  scenario "Editing a gallery" do
    #TODO make this possible
  end

  scenario "Editing a photo" do
    create_gallery "Church photos", image: {
      caption: "Church exterior",
      file_path: Rails.root.join("spec/features/files/test.png")
    }

    click_link "Edit"
    fill_in "Caption", with: "Church interior"
    click_button "Save"

    expect(page).not_to have_css "a[title='Church exterior']"
    expect(page).not_to have_css "img[alt='Church exterior'][src^='/uploads/photo/image/']"
    expect(page).to have_css "a[title='Church interior']"
    expect(page).to have_css "img[alt='Church interior'][src^='/uploads/photo/image/']"
  end

  scenario "Deleting a photo" do
    create_gallery "Church photos", image: {
      caption: "Church exterior",
      file_path: Rails.root.join("spec/features/files/test.png")
    }

    add_photo_to_gallery "Church photos",
      caption: "Church interior",
      file_path: Rails.root.join("spec/features/files/test.png")

    within(".gallery .item:first-child") { click_link "Delete" }

    expect(current_path).to eq "/photos/gallery"
    expect(page).not_to have_css "a[title='Church exterior']"
    expect(page).not_to have_css "img[alt='Church exterior'][src^='/uploads/photo/image/']"
  end

  scenario "Deleting all photos in a gallery" do
    create_gallery "Church photos", image: {
      caption: "Church exterior",
      file_path: Rails.root.join("spec/features/files/test.png")
    }

    within(".gallery .item") { click_link "Delete" }

    expect(current_path).to eq "/galleries"
    expect(page).not_to have_link "Church photos"
  end

  scenario "Deleting a gallery directly" do
    #TODO make this possible
  end
end
