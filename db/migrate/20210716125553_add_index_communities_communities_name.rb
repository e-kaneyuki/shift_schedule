class AddIndexCommunitiesCommunitiesName < ActiveRecord::Migration[6.1]
  def change
    add_index :communities, :communities_name, unique: true
  end
end
