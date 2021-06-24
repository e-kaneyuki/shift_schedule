class RenameCommunityIdColumnToShiftCalendars < ActiveRecord::Migration[6.1]
  def change
    rename_column :shift_calendars, :community_id, :staff_members_id
  end
end
