class CreateShiftCalendars < ActiveRecord::Migration[6.1]
  # def change
  #   create_table :shift_calendars do |t|

  #     t.timestamps
  #   end
  # end
  def up
    create_table :shift_calendars do |t|
      t.integer :shift_calender, null: false
      t.bigint :community_id, null: false

      t.timestamps
    end
  end

  def down
  end
end
