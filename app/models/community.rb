class Community < ApplicationRecord
  has_many :users, through: :community_users
  has_many :shift_calendars, dependent: :delete_all
end
