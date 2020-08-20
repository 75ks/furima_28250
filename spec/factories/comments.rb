FactoryBot.define do
  factory :comment do
    comment     { 'こんにちは' }
    association :user
    association :item
  end
end
