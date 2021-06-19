class CreateShiftCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :shift_calendars do |t|

      t.timestamps
    end
  end
end
