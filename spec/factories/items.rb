FactoryBot.define do
  factory :item do
    name             {Faker::Lorem.sentence}
    description      {Faker::Lorem.sentence}
    category_id      {2}
    condition_id     {2}
    state_id         {2}
    delivery_days_id {2}
    fee_id           {2}
    price            {500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end