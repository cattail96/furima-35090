FactoryBot.define do
  factory :item do
    item_name        { '商品名' }
    item_explanation { '商品説明文' }
    category_id      { 1 }
    condition_id     { 1 }
    delivery_fee_id  { 1 }
    prefecture_id    { 1 }
    delivery_days_id { 1 }
    price            { 1350 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
