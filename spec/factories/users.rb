FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    confirmed_at Time.now

    trait :unconfirmed do
      confirmed_at nil
    end
  end
end