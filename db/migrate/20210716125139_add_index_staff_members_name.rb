class AddIndexStaffMembersName < ActiveRecord::Migration[6.1]
  def change
    add_index :staff_members, :name, unique: true
  end
end
