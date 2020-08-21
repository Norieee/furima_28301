FactoryBot.define do
  factory :itemAddress do
    postal_code { "123-4567" }
    prefecture_id { Prefecture.all.sample[:id] }
    city { Faker::Food.fruits }
    address { Faker::House.room }
    building { Faker::House.furniture }
    phone_number { Faker::Number.number(digits: 11) }
  end
end