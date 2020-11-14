FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"全角"}
    first_name            {"かな"}
    family_name_kana      {"ゼンカク"}
    first_name_kana       {"カナ"}
    birthday              {"2000-1-1"}
  end
end