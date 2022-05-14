require 'rails_helper'

RSpec.describe InventoryItem, type: :model do
  describe "relationships" do
    it { should belong_to :merchant }
    it { should have_many(:shipments).through(:shipment_inventory_items) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:inventory_count) }
    it { should validate_numericality_of(:price) }
  end
end
