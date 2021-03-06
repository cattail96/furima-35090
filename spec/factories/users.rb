FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'abc000000' }
    password_confirmation { password }
    family_name           { '安倍' }
    first_name            { '一郎' }
    family_name_kana      { 'アベ' }
    first_name_kana       { 'イチロー' }
    birthday              { '1900-12-31' }
  end
end
