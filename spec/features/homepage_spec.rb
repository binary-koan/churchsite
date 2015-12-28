require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  def login
    user = create(:user)

    visit "/users/sign_in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "Testing1"
    click_button "Sign in"
  end

  def logout
    click_link "Sign out"
  end

  def create_homepage
    visit "/pages/new"
    select "Homepage", from: "Type"
    fill_in "Title", with: "Home"
    click_button "Save"
  end

  def edit_homepage_section(link_title)
    click_link "Edit content"
    click_link link_title

    yield

    click_button "Save"
  end

  before do
    login
    create_homepage

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
end
