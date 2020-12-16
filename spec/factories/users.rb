FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { 'test111' }
    password_confirmation { 'test111' }
    last_name             { '漢字' }
    first_name            { 'ひらがな' }
    last_name_kana        { 'カタカナ' }
    first_name_kana       { 'カタカナ' }
    birthday              { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end
