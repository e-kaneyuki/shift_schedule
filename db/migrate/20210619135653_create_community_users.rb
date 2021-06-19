class CreateCommunityUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :community_users do |t|

      t.timestamps
    end
  end
end
