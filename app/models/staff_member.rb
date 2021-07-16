class StaffMember < ApplicationRecord
  belongs_to :shift_calendar

  # スタッフの属性　名前　部門　病棟　役職
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :group, presence: true
  validates :ward, presence: true
  validates :position, presence: true

  # 勤務希望
end
