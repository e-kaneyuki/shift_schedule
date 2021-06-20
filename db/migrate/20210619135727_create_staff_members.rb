class CreateStaffMembers < ActiveRecord::Migration[6.1]
  def up
    create_table :staff_members do |t|
      t.string :name, null: false
      t.string :position, null: false
      t.string :group, null: false
      t.string :ward, null: false

      t.timestamps
    end
  end

  def down
  end
end
