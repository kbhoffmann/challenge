class AddStatusToInventoryItems < ActiveRecord::Migration[5.2]
  def change
    add_column :inventory_items, :status, :integer, :default => 0
  end
end
