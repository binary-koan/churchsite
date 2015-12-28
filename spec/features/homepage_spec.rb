require "rails_helper"
require "steps/authentication"
require "steps/homepage"

RSpec.feature "Homepage", type: :feature do
  include Steps::Authentication
  include Steps::Homepage

  before do
    login
    create_homepage
  end

  scenario "Creating the default homepage" do
    visit "/"

    expect(page).to have_text "Our Parish"
  end

  scenario "Editing the header information" do
    edit_homepage_section "Homepage options" do
      fill_in "Church name", with: "Lincoln Union Church"
      fill_in "Denomination", with: "Methodist"
      fill_in "Tagline", with: "Our mission is to know God and to make God known"
    end

    logout

    visit "/"

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

    visit "/"

    expect(page).to have_text "Pastor"
    expect(page).to have_text "Joe Bloggs"
    expect(page).to have_text "Phone0000"
    expect(page).to have_text "Emailjoe@lincolnchurch.org.nz"
    expect(page).to have_text "AddressNowhere"
  end

  scenario "Adding a church" do
    #TODO
  end

  scenario "Adding multiple churches" do
    #TODO
  end

  scenario "Editing a church" do
    #TODO
  end

  scenario "Deleting a church" do
    #TODO
  end
end
