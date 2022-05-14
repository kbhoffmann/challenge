class Merchant < ApplicationRecord
  has_many :inventory_items
  validates :name, presence: true
end
