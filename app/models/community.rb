# == Schema Information
#
# Table name: communities
#
#  id               :bigint           not null, primary key
#  communities_name :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_communities_on_communities_name  (communities_name) UNIQUE
#
class Community < ApplicationRecord
  has_many :users, through: :community_users
  has_many :shift_calendars, dependent: :delete_all

  validates :communities_name, presence: true, uniqueness: true, length: { maximum: 20 }
end
