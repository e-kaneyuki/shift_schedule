FactoryBot.define do
  factory :user do
    sequence(:name) { Faker::JapaneseMedia::Doraemon.character}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { Faker::Internet.password(min_length: 6, max_length: 20) }
    sequence(:community) { Faker::JapaneseMedia::Doraemon.gadget }
    sequence(:community_id) { Faker::Number.between(from: 1, to: 30) }
  end
end
