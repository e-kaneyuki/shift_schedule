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
class CommunityUser < ApplicationRecord
  belongs_to :community
  belongs_to :user
end
