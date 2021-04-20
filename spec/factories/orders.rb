FactoryBot.define do
  factory :order_address do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    city          { 'aaa' }
    house_number  { 'aa1' }
    building_name { 'abc123' }
    phone_number  { '09012345678' }
    prefecture_id { 1 }
  end
end