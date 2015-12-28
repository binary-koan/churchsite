require "rails_helper"
require "steps/sermons"

RSpec.feature "Sermons", type: :feature do
  include Steps::Sermons

  background do
    login
    create_sermons_page
  end

  scenario "Adding a sermon" do
    add_sermon(
      title: "Jesus is risen",
      introduction: "He is risen indeed",
      content: "<p>Lift up your hearts</p>",
      date: "28 Dec"
    )

    expect(current_path).to match /^\/word\/[0-9a-f]+/
    expect(page).to have_text "Jesus is risen"
    expect(page).to have_text "He is risen indeed"
    expect(page).to have_text "Lift up your hearts"
  end

  scenario "Adding multiple sermons" do
    add_sermon(
      title: "Jesus is risen",
      introduction: "He is risen indeed",
      content: "<p>Lift up your hearts</p>",
      date: "28 Dec 2015"
    )

    add_sermon(
      title: "The Lord is here",
      introduction: "God's spirit is with us",
      content: "<p>Lift up your hearts</p>",
      date: "30 Jan 2016"
    )

    expect(current_path).to match /^\/word\/[0-9a-f]+/
    expect(page).to have_text "The Lord is here"

    visit "/from-the-minister"

    expect(page).to have_text "28 Dec 2015"
    expect(page).to have_text "Jesus is risen"
    expect(page).to have_text "He is risen indeed"
    expect(page).to have_text "30 Jan 2016"
    expect(page).to have_text "The Lord is here"
    expect(page).to have_text "God's spirit is with us"

    expect(page).not_to have_text "Lift up your hearts"
  end

  scenario "Editing a sermon" do
    add_sermon(
      title: "Jesus is risen",
      introduction: "He is risen indeed",
      content: "<p>Lift up your hearts</p>",
      date: "28 Dec"
    )

    click_link "Edit"
    fill_in "Title", with: "Jesus is alive"
    click_button "Save"

    expect(page).to have_text "Jesus is alive"
    expect(page).not_to have_text "Jesus is risen"
  end

  scenario "Deleting a sermon" do
    add_sermon(
      title: "Jesus is risen",
      introduction: "He is risen indeed",
      content: "<p>Lift up your hearts</p>",
      date: "28 Dec"
    )

    click_link "Delete"

    expect(current_path).to eq "/from-the-minister"
    expect(page).not_to have_text "Jesus is risen"
  end
end
