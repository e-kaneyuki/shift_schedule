# == Schema Information
#
# Table name: shift_calendars
#
#  id                :bigint           not null, primary key
#  schedule_calender :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  staff_members_id  :bigint           not null
#
FactoryBot.define do
  factory :shift_calendar do
  end
end
