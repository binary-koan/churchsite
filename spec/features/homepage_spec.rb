require "rails_helper"
require "steps/authentication"
require "steps/pages"
require "steps/homepage"

RSpec.feature "Homepage", type: :feature do
  include Steps::Authentication
  include Steps::Pages
  include Steps::Homepage

  background do
    login
    create_page type: "Homepage", title: "Home"
    visit "/"
  end

  scenario "Creating the default homepage" do
    expect(page).to have_text "Our Parish"
  end

  scenario "Editing the header information" do
    edit_homepage_section "Homepage options" do
      fill_in "Church name", with: "Lincoln Union Church"
      fill_in "Denomination", with: "Methodist"
      fill_in "Tagline", with: "Our mission is to know God and to make God known"
    end

    logout

    expect(current_path).to eq "/"
    expect(page).to have_text "Lincoln Union Church"
    expect(page).to have_text "Methodist"
    expect(page).to have_text "Our mission is to know God and to make God known"
  end

  scenario "Editing the leader information" do
    edit_homepage_section "Homepage options" do
      fill_in "Title", with: "Pastor"
      fill_in "Name", with: "Joe Bloggs"
      fill_in "Phone number", with: "0000"
      fill_in "Email address", with: "joe@lincolnchurch.org.nz"
      fill_in "Physical address", with: "Nowhere"
    end

    logout

    expect(current_path).to eq "/"
    expect(page).to have_text "Pastor"
    expect(page).to have_text "Joe Bloggs"
    expect(page).to have_text "Phone0000"
    expect(page).to have_text "Emailjoe@lincolnchurch.org.nz"
    expect(page).to have_text "AddressNowhere"
  end

  scenario "Adding a church" do
    add_church(
      name: "Lincoln",
      services: "Sundays 10am",
      address: "Near Rolleston",
      map_address: "Lincoln"
    )

    expect(current_path).to eq "/"

    within(:css, ".church") do
      expect(page).to have_text "Lincoln"
      expect(page).to have_text "Sundays 10am"
      expect(page).to have_text "Near Rolleston"
      expect(page).to have_css "a[href*='maps.google.com/?q=Lincoln']"
    end
  end

  scenario "Adding multiple churches" do
    add_church(
      name: "Lincoln",
      services: "Sundays 10am",
      address: "Near Rolleston",
      map_address: "Lincoln"
    )

    add_church(
      name: "Rolleston",
      services: "Sundays 9am",
      address: "Near Lincoln",
      map_address: "Rolleston"
    )

    within(:css, ".church:first-child") do
      expect(page).to have_text "Lincoln"
      expect(page).to have_text "Sundays 10am"
      expect(page).to have_text "Near Rolleston"
      expect(page).to have_css "a[href*='maps.google.com/?q=Lincoln']"
    end

    within(:css, ".church:last-child") do
      expect(page).to have_text "Rolleston"
      expect(page).to have_text "Sundays 9am"
      expect(page).to have_text "Near Lincoln"
      expect(page).to have_css "a[href*='maps.google.com/?q=Rolleston']"
    end
  end

  scenario "Editing a church" do
    add_church
    within(".church") { click_link "Edit" }

    fill_in "Name", with: "Lincoln 2"
    fill_in "Address", with: "Not near Rolleston"
    click_button "Save"

    expect(current_path).to eq "/"

    within(:css, ".church") do
      expect(page).to have_text "Lincoln 2"
      expect(page).to have_text "Not near Rolleston"
    end
  end

  scenario "Deleting a church" do
    add_church(
      name: "Lincoln",
      services: "Sundays 10am"
    )

    within(".church") { click_link "Delete" }

    expect(page).not_to have_text "Lincoln"
    expect(page).not_to have_text "Sundays 10am"
  end
end
