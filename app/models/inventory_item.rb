class InventoryItem < ApplicationRecord
  belongs_to :merchant
  has_many :shipment_inventory_items
  has_many :shipments, through: :shipment_inventory_items
  validates :name, :description, :inventory_count, presence: true
  validates :price, numericality: { only_integer: true }
end
