FactoryBot.define do
  factory :user do
    name { Faker::JapaneseMedia::Doraemon.character }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6, max_length: 8) }
  end
end
