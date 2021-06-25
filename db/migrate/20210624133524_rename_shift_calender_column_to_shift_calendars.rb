class RenameShiftCalenderColumnToShiftCalendars < ActiveRecord::Migration[6.1]
  def change
    rename_column :shift_calendars, :shift_calender, :schedule_calender
  end
end
