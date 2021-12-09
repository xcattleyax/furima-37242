FactoryBot.define do
  factory :detail do
    postal_code   { "#{Faker::Number.number(digits: 3)}"+"-"+"#{ Faker::Number.number(digits: 4)}"}
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    addresses     { Faker::Address.street_address }
    building      { Faker::Address.building_number}
    phone_number  { Faker::Number.number(digits: 10)}
    token         { Faker::Lorem.sentence }
  end
end