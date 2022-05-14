class Shipment < ApplicationRecord
  has_many :shipment_inventory_items
  has_many :inventory_items, through: :shipment_inventory_items
  validates :customer_name, presence: true
  validates :customer_address, presence: true
end
