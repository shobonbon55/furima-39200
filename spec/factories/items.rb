FactoryBot.define do
  factory :item do
    item_name             {Faker::Name.initials(number: 40)}
    description           {Faker::Lorem.characters(number: 10)}
    category_id           {Faker::Number.between(from: 2, to: 5) }
    condition_id          {Faker::Number.between(from: 2, to: 6) }
    courier_fare_id       {Faker::Number.between(from: 2, to: 3) }
    send_area_id          {Faker::Number.between(from: 2, to: 10) }
    send_period_id        {Faker::Number.between(from: 2, to: 4) }
    price                 {Faker::Number.between(from: 300, to: 99999) }
    association :user 


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end


