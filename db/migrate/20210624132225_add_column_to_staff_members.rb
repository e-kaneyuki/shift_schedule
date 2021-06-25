class AddColumnToStaffMembers < ActiveRecord::Migration[6.1]
  def change
    change_table :staff_members, bulk: true do |t|
      t.datetime :desired_date_of_work
      t.datetime :desired_holiday_date
      t.float :the_number_of_paid_holidays, null: false, default: ""
      t.integer :possible_continuous_work, null: false, default: ""
      t.integer :hope_for_consecutive_holidays, null: false, default: ""
    end
  end
end
