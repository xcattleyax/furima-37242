FactoryBot.define do
  factory :item do
    name                  { Faker::Name.name }
    info                  { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(2,12) }
    sales_status_id       { Faker::Number.between(2,7) }
    shipping_fee_id       { Faker::Number.between(2,3) }
    prefecture_id         { Faker::Number.between(2,48) }
    scheduled_delivery_id { Faker::Number.between(2,4) }
    price                 { Faker::Number.between(300,9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end