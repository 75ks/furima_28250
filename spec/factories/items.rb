FactoryBot.define do
  factory :item do
    name               {Faker::Food.fruits}
    price              {Faker::Number.within(range: 300..9_999_999)}
    introduction       {Faker::Food.fruits}
    category_id        {Faker::Number.within(range: 2..11)}
    item_condition_id  {Faker::Number.within(range: 2..7)}
    postage_payer_id   {Faker::Number.within(range: 2..3)}
    area_id            {Faker::Number.within(range: 2..48)}
    preparation_day_id {Faker::Number.within(range: 2..4)}
    association        :user
  end
end
