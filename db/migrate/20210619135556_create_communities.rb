class CreateCommunities < ActiveRecord::Migration[6.1]
  def up
    create_table :communities do |t|
      t.string :communities_name, null: false
      t.timestamps
    end
  end

  def down
  end
end
