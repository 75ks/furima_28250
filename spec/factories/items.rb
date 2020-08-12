FactoryBot.define do
  factory :item do
    name               { 'Tシャツ' }
    price              { 3000 }
    introduction       { 'Tシャツです。色は白です。' }
    category_id        { 3 }
    item_condition_id  { 2 }
    postage_payer_id   { 3 }
    area_id            { 12 }
    preparation_day_id { 2 }
    association        :user
  end
end
