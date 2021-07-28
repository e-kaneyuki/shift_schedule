# == Schema Information
#
# Table name: staff_members
#
#  id                            :bigint           not null, primary key
#  desired_date_of_work          :datetime
#  desired_holiday_date          :datetime
#  group                         :string           not null
#  hope_for_consecutive_holidays :integer          not null
#  name                          :string           not null
#  position                      :string           not null
#  possible_continuous_work      :integer          not null
#  the_number_of_paid_holidays   :float            not null
#  ward                          :string           not null
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
# Indexes
#
#  index_staff_members_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :staff_member do
  end
end
