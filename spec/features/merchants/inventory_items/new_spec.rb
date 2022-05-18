require 'rails_helper'

RSpec.describe 'New Inventory Item Creation' do
  it 'has a link from the merchant item index page to add an item' do
    merchant_1 = Merchant.create!(name: "Merchant One Name")
    merchant_2 = Merchant.create!(name: "Merchant Two Name")

    visit "merchants/#{merchant_1.id}/inventory_items"

    click_link "Add New Item"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/inventory_items/new")
    expect(current_path).to_not eq("/merchants/#{merchant_2.id}/inventory_items/new")
  end

  it 'can create a new item' do
    merchant_1 = Merchant.create!(name: "Merchant One Name")
    item_1 = merchant_1.inventory_items.create!(name: "Item 1 Name", description: "Item 1 Description", price: 40.00, inventory_count: 100)
    item_2 = merchant_1.inventory_items.create!(name: "Item 2 Name", description: "Item 2 Description", price: 20.00, inventory_count: 200)

    merchant_2 = Merchant.create!(name: "Merchant Two Name")
    item_3 = merchant_2.inventory_items.create!(name: "Item 3 Name", description: "Item 3 Description", price: 100.00, inventory_count: 50)


    visit "/merchants/#{merchant_1.id}/inventory_items/new"

    fill_in('Name' , with: "Another Item Name")
    fill_in('Description' , with: "Another Item Description")
    fill_in('Inventory Count' , with: 300)
    fill_in('Price', with: 25)

    click_on("Submit")

    expect(current_path).to eq("/merchants/#{merchant_1.id}/inventory_items")

    new_item = InventoryItem.last
    expect(new_item.name).to eq("Another Item Name")
    expect(new_item.description).to eq("Another Item Description")
    expect(new_item.inventory_count).to eq(300)
    expect(new_item.price).to eq(25)
    merchant_1_items = Merchant.find(merchant_1.id).inventory_items
    expect(merchant_1_items.count).to eq(3)
    expect(page).to have_content("Successfully Added #{new_item.name}")
  end

  it 'shows an error if the fields are not filled out correctly' do
    merchant = Merchant.create!(name: "Merchant One Name")
    visit "/merchants/#{merchant.id}/inventory_items/new"

    click_on("Submit")

    expect(page).to have_content("Item not created")
    expect(current_path).to eq("/merchants/#{merchant.id}/inventory_items/new")
  end
end
