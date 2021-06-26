class Community < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :shift_calendars
end
