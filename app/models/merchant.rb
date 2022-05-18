class Merchant < ApplicationRecord
  has_many :inventory_items
  validates :name, presence: true
  scope :active_items, -> { inventory_items.where(status: 0)}

  def active_items
    inventory_items.where(status: 0)
  end

  def deleted_items
    inventory_items.where(status: 1)
  end
end
