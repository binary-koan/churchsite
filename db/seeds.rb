# Create an initial admin user

user = User.create!(
  name: ENV["INITIAL_USER_NAME"] || "Test User",
  email: ENV["INITIAL_USER_EMAIL"] || "test@example.com",
  password: ENV["INITIAL_USER_PASSWORD"] || "Testing1",
  password_confirmation: ENV["INITIAL_USER_PASSWORD"] || "Testing1"
)

user.confirm

# Create a homepage so going to / works

Page.create!(type: "homepage", title: "Home")

puts "Seeded!"
