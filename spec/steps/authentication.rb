module Steps
  module Authentication
    def sign_up(name: "Fritz", email: "fritz@nomail.com", password: "Testing1")
      visit "/users/sign_up"

      fill_in "Name", with: name
      fill_in "Email", with: email
      fill_in "Password", with: password
      fill_in "Password confirmation", with: password

      click_button "Sign up"
    end

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
      login unless page.has_link?("Sign out")
      click_link "Edit content" if page.has_link?("Edit content")
    end
  end
end
