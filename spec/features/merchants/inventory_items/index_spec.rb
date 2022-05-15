require 'rails_helper'

RSpec.describe 'merchant item index page' do
  it 'shows a list of each item for a particular merchant' do
    merchant_1 = Merchant.create!(name: "Merchant One Name")
    item_1 = merchant_1.inventory_items.create!(name: "Item 1 Name", description: "Item 1 Description", price: 40.00, inventory_count: 100)
    item_2 = merchant_1.inventory_items.create!(name: "Item 2 Name", description: "Item 2 Description", price: 20.00, inventory_count: 200)
    merchant_2 = Merchant.create!(name: "Merchant Two Name")
    item_3 = merchant_2.inventory_items.create!(name: "Item 3 Name", description: "Item 3 Description", price: 100.00, inventory_count: 50)

    visit "/merchants/#{merchant_1.id}/inventory_items"

    expect(page).to have_content("Item 1 Name")
    expect(page).to have_content("Item 2 Name")
    expect(page).to_not have_content("Item 3 Name")
  end

  it 'has a link to create a new item' do
    merchant = Merchant.create!(name: "Merchant One Name")

    visit "/merchants/#{merchant.id}/inventory_items"

    click_link("Add New Item")

    expect(current_path).to eq("/merchants/#{merchant.id}/inventory_items/new")
  end

  it 'each inventory item has a link to update it' do
    merchant = Merchant.create!(name: "Merchant One Name")
    item_1 = merchant.inventory_items.create!(name: "Item 1 Name", description: "Item 1 Description", price: 40.00, inventory_count: 100)
    visit "/merchants/#{merchant.id}/inventory_items"

    click_link "Edit #{item_1.name}"

    expect(current_path).to eq("/merchants/#{merchant.id}/inventory_items/#{item_1.id}/edit")
  end

  it 'each inventory item has a link to delete it' do
    merchant = Merchant.create!(name: "Merchant One Name")
    item_1 = merchant.inventory_items.create!(name: "Item 1 Name", description: "Item 1 Description", price: 40.00, inventory_count: 100)
    item_2 = merchant.inventory_items.create!(name: "Item 2 Name", description: "Item 2 Description", price: 20.00, inventory_count: 200)

    visit "/merchants/#{merchant.id}/inventory_items"

    click_link "Delete #{item_1.name}"

    expect(current_path).to eq("/merchants/#{merchant.id}/inventory_items")
    expect(page).to_not have_content(item_1.name)
    expect(page).to have_content(item_2.name)
  end
end
