FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password { 'a12345' }
    password_confirmation { password }
    first_name { 'あア阿' }
    last_name { 'あア阿' }
    f_name_kana { 'ア' }
    l_name_kana { 'ア' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
