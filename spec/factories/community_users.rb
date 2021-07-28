# == Schema Information
#
# Table name: community_users
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  community_id :bigint           not null
#  user_id      :bigint           not null
#
FactoryBot.define do
  factory :community_user do
  end
end
