FactoryBot.define do
  factory :item do
    name { Faker::Name.initials }
    explanation { Faker::String.random }
    category_id { Category.all.sample[:id] }
    status_id { Status.all.sample[:id] }
    shipping_charges_id { ShippingCharge.all.sample[:id] }
    prefecture_id { Prefecture.all.sample[:id] }
    days_until_shipping_id { DaysUntilShipping.all.sample[:id] }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user
  end
end
