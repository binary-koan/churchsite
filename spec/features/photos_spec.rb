require "rails_helper"
require "steps/authentication"
require "steps/photos"

RSpec.feature "Photos", type: :feature do
  include Steps::Authentication
  include Steps::Photos

  scenario "Creating a gallery with one photo" do
    #TODO
  end

  scenario "Adding a photo to an existing gallery" do
    #TODO
  end

  scenario "Rearranging photos in a gallery" do
    #TODO
  end

  scenario "Editing a gallery" do
    #TODO
  end

  scenario "Editing a photo" do
    #TODO
  end

  scenario "Deleting a photo" do
    #TODO
  end

  scenario "Deleting all photos in a gallery" do
    #TODO
  end

  scenario "Deleting a gallery directly" do
    #TODO
  end
end
