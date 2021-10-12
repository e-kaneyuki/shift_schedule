# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    name { Faker::JapaneseMedia::Doraemon.character }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    # deviseのvalidationでパスワードは6~128桁に設定されている
    # config.password_length = 6..128
    # password { Faker::Internet.password(min_length: 6, max_length: 8) }
  end
end
