module Steps
  module Authentication
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

    def start_editing
      click_link "Edit content" if page.has_link?("Edit content")
    end
  end
end
