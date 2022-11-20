FactoryBot.define do
  factory :item do
    name                  { Faker::Name.initials(number: 2) }
    description           { Faker::Lorem.paragraph }
    category_id           { Category.find(Faker::Number.between(from: 2, to: 11)).id}
    sales_status_id       { SalesStatus.find(Faker::Number.between(from: 2, to: 7)).id }
    fee_status_id         { FeeStatus.find(Faker::Number.between(from: 2, to: 3)).id }
    prefecture_id         { Prefecture.find(Faker::Number.between(from: 2, to: 48)).id }
    scheduled_delivery_id { ScheduledDelivery.find(Faker::Number.between(from: 2, to: 4)).id }
    price                 { Faker::Number.within(range: 300..9999999) }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
