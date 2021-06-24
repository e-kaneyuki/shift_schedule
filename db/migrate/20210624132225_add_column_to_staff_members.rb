class AddColumnToStaffMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :staff_members, :desired_date_of_work, :datetime, null: true
    add_column :staff_members, :desired_holiday_date, :datetime, null: true
    add_column :staff_members, :the_number_of_paid_holidays, :float, null: false
    add_column :staff_members, :possible_continuous_work, :integer, null: false
    add_column :staff_members, :hope_for_consecutive_holidays, :integer, null: false
  end
end
