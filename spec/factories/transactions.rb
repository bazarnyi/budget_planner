FactoryBot.define do
  factory :transaction do
    amount { Faker::Number.number 4 }
    date { Faker::Time.between(Time.zone.now - 86400, Time.zone.now) }
    user
  end
end
