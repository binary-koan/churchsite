require "rails_helper"
require "steps/authentication"
require "steps/pages"

RSpec.feature "Admin utilities", type: :feature do
  include Steps::Authentication
  include Steps::Pages

  background do
    login
    create_page type: "Homepage", title: "Home"
    logout
  end

  scenario "Going to /admin" do
    visit "/admin"
    expect(current_path).to eq "/users/sign_in"

    login
    visit "/admin"
    expect(current_path).to eq "/"
  end
end
