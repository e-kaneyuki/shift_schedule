class RemoveCommunityIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :community_id, :string
  end
end
