class User < ApplicationRecord
  has_many :communities, through: :community_users

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :password_digest, presence: true, length: { minimum: 6 }
  validates :communitty_id, presence: true, uniqueness: true, numericality: { only_integer: true }
end
