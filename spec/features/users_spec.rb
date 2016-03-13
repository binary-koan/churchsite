require "rails_helper"
require "steps/authentication"
require "steps/homepage"

RSpec.feature "User management", type: :feature do
  include Steps::Authentication
  include Steps::Homepage

  background do
    login
    create_homepage
    logout
  end

  scenario "Signing up" do
    sign_up

    expect(page).to have_text "Your account has been created, but an existing administrator will need to confirm it before you can log in."
  end

  scenario "Getting your account confirmed" do
    sign_up(email: "tinkerbell@fairyland.com", password: "Testing1")

    login
    visit "/admin/users"

    expect(page).to have_text "Not yet confirmed"
    expect(page).to have_text "tinkerbell@fairyland.com"

    click_link "Confirm"

    expect(page).not_to have_text "Not yet confirmed"
    expect(page).to have_text "tinkerbell@fairyland.com"
  end

  scenario "Getting your account denied" do
    sign_up(email: "tinkerbell@fairyland.com", password: "Testing1")

    login
    visit "/admin/users"

    expect(page).to have_text "Not yet confirmed"
    expect(page).to have_text "tinkerbell@fairyland.com"

    click_link "Deny"

    expect(page).not_to have_text "Not yet confirmed"
    expect(page).not_to have_text "tinkerbell@fairyland.com"
  end

  scenario "Editing your profile" do
    #TODO
  end

  scenario "Deleting your account" do
    #TODO
  end
end
