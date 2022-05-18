require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "relationships" do
    it { should have_many :inventory_items }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe 'instance methods' do
    it 'filters by active items' do
      merchant = Merchant.create!(name: "Merchant One Name")
      item_1 = merchant.inventory_items.create!(name: "Item 1 Name", description: "Item 1 Description", price: 20.00, inventory_count: 100, status: 0)
      item_2 = merchant.inventory_items.create!(name: "Item 2 Name", description: "Item 2 Description", price: 20.00, inventory_count: 200, status: 1)
      item_3 = merchant.inventory_items.create!(name: "Item 3 Name", description: "Item 3 Description", price: 20.00, inventory_count: 200, status: 0)
      item_4 = merchant.inventory_items.create!(name: "Item 4 Name", description: "Item 4 Description", price: 20.00, inventory_count: 200, status: 1)

      expect(merchant.active_items).to include(item_1, item_3)
      expect(merchant.active_items).to_not include(item_2, item_4)
    end

    it 'filters by deleted items' do
      merchant = Merchant.create!(name: "Merchant One Name")
      item_1 = merchant.inventory_items.create!(name: "Item 1 Name", description: "Item 1 Description", price: 20.00, inventory_count: 100, status: 0)
      item_2 = merchant.inventory_items.create!(name: "Item 2 Name", description: "Item 2 Description", price: 20.00, inventory_count: 200, status: 1)
      item_3 = merchant.inventory_items.create!(name: "Item 3 Name", description: "Item 3 Description", price: 20.00, inventory_count: 200, status: 0)
      item_4 = merchant.inventory_items.create!(name: "Item 4 Name", description: "Item 4 Description", price: 20.00, inventory_count: 200, status: 1)

      expect(merchant.deleted_items).to include(item_2, item_4)
      expect(merchant.deleted_items).to_not include(item_1, item_3)
    end
  end
end
