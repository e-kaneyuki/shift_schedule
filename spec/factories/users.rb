FactoryBot.define do
  factory :user do
    name { Faker::JapaneseMedia::Doraemon.character }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
