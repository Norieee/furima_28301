FactoryBot.define do
  factory :item do
    name { Faker::Name.initials }
    explanation { Faker::String.random }
    category_id { Faker::Number.within(range: 2..11) }
    status_id { Faker::Number.within(range: 2..7) }
    shipping_charges_id { Faker::Number.within(range: 2..3) }
    prefecture_id { Faker::Number.within(range: 1..47) }
    days_until_shipping_id { Faker::Number.within(range: 2..4) }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user
  end
end
