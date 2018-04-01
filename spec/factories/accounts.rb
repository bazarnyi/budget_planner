FactoryBot.define do
  factory :account do
    amount { Faker::Number.number 4 }
    user
  end
end
