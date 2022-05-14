class ShipmentInventoryItem < ApplicationRecord
  belongs_to :inventory_item
  belongs_to :shipment
  validates :inventory_item_quantity, presence: true, numericality: { greater_than: 0 }
end
