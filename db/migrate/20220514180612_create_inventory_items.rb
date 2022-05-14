class CreateInventoryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.text :description
      t.integer :inventory_count
      t.float :price

      t.timestamps
    end
  end
end
