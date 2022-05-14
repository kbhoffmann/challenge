class ShipmentInventoryItem < ApplicationRecord
  belongs_to :inventory_item
  belongs_to :shipment
  validates :inventory_item_quantity, presence: true, numericality: { only_integer: true }
end
