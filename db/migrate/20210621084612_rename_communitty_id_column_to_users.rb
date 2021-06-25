class RenameCommunittyIdColumnToUsers < ActiveRecord::Migration[6.1]
  def up
    rename_column :users, :communitty_id, :community_id
  end
end
