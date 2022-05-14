require 'rails_helper'

RSpec.describe Shipment, type: :model do
  describe "relationships" do
    it { should have_many(:inventory_items).through(:shipment_inventory_items) }
  end

  describe "validations" do
    it { should validate_presence_of(:customer_name) }
    it { should validate_presence_of(:customer_address) }
  end
end
