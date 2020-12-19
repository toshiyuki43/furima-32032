FactoryBot.define do
  factory :item do
    title { 'sample' }
    text { 'sample' }
    price { '10000' }
    category_id { '2' }
    item_condition_id { '2' }
    shipping_charge_id { '2' }
    prefecture_id { '2' }
    shipping_day_id { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
