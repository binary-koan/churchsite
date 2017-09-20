FactoryGirl.define do
  factory :user do
    name "Mr Pastor"
    email "minister@lincolnchurch.org.nz"
    password "Testing1"
    password_confirmation "Testing1"

    after(:build) do |user|
      user.confirm
    end
  end
end
