class ShiftCalendar < ApplicationRecord
  has_many :staff_members, dependent: :nullify
  belongs_to :community
end
