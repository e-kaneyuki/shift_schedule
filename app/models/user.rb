class User < ApplicationRecord
  has_many :communities, through: :community_users
end
