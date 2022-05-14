class AddMerchantToInventoryItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :inventory_items, :merchant, foreign_key: true
  end
end
