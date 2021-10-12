class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :users do |t|
      t.string :password_digest, null: false
      t.string :communitty_id, null: false
      t.timestamps
    end
  end

  def down
  end
end
