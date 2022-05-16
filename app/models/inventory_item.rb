class InventoryItem < ApplicationRecord
  belongs_to :merchant
  has_many :shipment_inventory_items
  has_many :shipments, through: :shipment_inventory_items
  validates :name, :description, :inventory_count, presence: true
  validates_numericality_of :inventory_count, greater_than: 0
  validates_numericality_of :price, greater_than: 0
  enum status: {active: 0, deleted: 1}
end
