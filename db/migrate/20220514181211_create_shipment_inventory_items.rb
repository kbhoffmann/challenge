class CreateShipmentInventoryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :shipment_inventory_items do |t|
      t.integer :inventory_item_quantity
      t.references :shipment, foreign_key: true
      t.references :inventory_item, foreign_key: true

      t.timestamps
    end
  end
end
