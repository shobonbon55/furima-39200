FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name_zen       {'山田'}
    first_name_zen        {'太郎'}
    family_name_kana      {'ヤマダ'} 
    first_name_kana       {'タロウ'} 
    birthday              {'19300101'}
  end
end

