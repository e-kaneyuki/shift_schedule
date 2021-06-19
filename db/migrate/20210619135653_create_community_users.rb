class CreateCommunityUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :community_users do |t|
      t.bigint :user_id, null: false
      t.bigint :community_id, null: false
      t.timestamps
    end
  end

  def down
  end
end
