FactoryBot.define do
  factory :transaction do
    amount { Faker::Number.decimal(2, 2) }
    date { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    user
  end
end
