class AddCommentsToInventoryItem < ActiveRecord::Migration[5.2]
  def change
    add_column :inventory_items, :deletion_comments, :text
  end
end
