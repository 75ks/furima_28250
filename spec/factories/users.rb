FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password      =        Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    family_name           {ForgeryJa(:name).last_name}
    first_name            {ForgeryJa(:name).first_name}
    family_name_kana      {ForgeryJa(:name).last_name(:to => ForgeryJa::KANA)}
    first_name_kana       {ForgeryJa(:name).first_name(:to => ForgeryJa::KANA)}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end