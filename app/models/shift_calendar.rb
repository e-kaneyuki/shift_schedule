class ShiftCalendar < ApplicationRecord
  has_many :staff_members
  belongs_to :community
end
