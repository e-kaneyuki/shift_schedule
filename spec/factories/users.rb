FactoryBot.define do
  factory :user do
    sequence(:name) { Faker::JapaneseMedia::Doraemon.character}
    sequence(:email) { Faker::Internet.email }
    sequence(:password) { Faker::Internet.password(min_length: 6, max_length: 20) }
    # sequence(:community) { Faker::JapaneseMedia::Doraemon.gadget }
  end
end
