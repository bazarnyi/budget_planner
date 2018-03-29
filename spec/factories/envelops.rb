FactoryBot.define do
  factory :envelop do
    amount { Faker::Number.decimal(2, 2) }
    user

    trait :balance do
      category 0
    end
  end
end
