FactoryBot.define do
  factory :order_address do
post_num            { '123-4567' }
preference_id       {Faker::Number.between(from: 2, to: 10) }
city                { '東京都' }
house_num           { '1-1' }
house_name          {'柳ビル103'}
phone_num           { '09011111111' }
token {"tok_abcdefghijk00000000000000000"}
# association :order
  end
end

