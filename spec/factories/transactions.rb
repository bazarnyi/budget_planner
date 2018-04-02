FactoryBot.define do
  factory :transaction do
    amount { Faker::Number.number 4 }
    date { Faker::Time.between(DateTime.now - 1, Time.zone.now) }
    user
  end
end
