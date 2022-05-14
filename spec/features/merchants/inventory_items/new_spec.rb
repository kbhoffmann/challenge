require 'rails_helper'

RSpec.describe 'New Inventory Item Creation' do
  it 'has a link from the merchant item index page to add an item' do
    merchant_1 = Merchant.create!(name: "Merchant One Name")

    visit "merchants/#{merchant_1.id}/inventory_items"

    click_link "Add New Item"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/inventory_items/new")
  end
end
