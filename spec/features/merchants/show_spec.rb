require 'rails_helper'

RSpec.describe 'Merchant Show Page' do
  it 'shows the name of a merchant' do
    merchant_1 = Merchant.create!(name: "Merchant One Name")
    merchant_2 = Merchant.create!(name: "Merchant Two Name")

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_content("#{merchant_1.name}")
    expect(page).to_not have_content("#{merchant_2.name}")
  end

  it 'links to their list of inventory items' do
    merchant_1 = Merchant.create!(name: "Merchant One Name")
    merchant_2 = Merchant.create!(name: "Merchant Two Name")

    visit "/merchants/#{merchant_1.id}"

    click_link "See Item Inventory"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/inventory_items/")
    expect(current_path).to_not eq("/merchants/#{merchant_2.id}/inventory_items/")
  end
end
