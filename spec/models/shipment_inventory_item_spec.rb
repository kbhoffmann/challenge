require 'rails_helper'

RSpec.describe ShipmentInventoryItem, type: :model do
  describe "relationships" do
    it { should belong_to :inventory_item }
    it { should belong_to :shipment }
  end

  describe "validations" do
    it { should validate_presence_of(:inventory_item_quantity) }
    it { should validate_numericality_of(:inventory_item_quantity) }
  end
end
