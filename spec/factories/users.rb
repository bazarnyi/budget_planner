# This will guess the User class
FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password}
  end
end