FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    confirmed_at Time.zone.now

    trait :unconfirmed do
      confirmed_at nil
    end

    trait :github do
      provider 'github'
      uid { Faker::Number.number 8 }
    end

    trait :google do
      provider 'google_oauth2'
      uid { Faker::Number.number 9 }
    end
  end
end