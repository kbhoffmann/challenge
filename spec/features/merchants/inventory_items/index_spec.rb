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

    click_link "Edit Details for #{item_1.name}"

    expect(current_path).to eq("/merchants/#{merchant.id}/inventory_items/#{item_1.id}/edit")
  end

  it 'each inventory item has a link to delete it' do
    merchant = Merchant.create!(name: "Merchant One Name")
    item_1 = merchant.inventory_items.create!(name: "Item 1 Name", description: "Item 1 Description", price: 40.00, inventory_count: 100)
    item_2 = merchant.inventory_items.create!(name: "Item 2 Name", description: "Item 2 Description", price: 20.00, inventory_count: 200)

    visit "/merchants/#{merchant.id}/inventory_items"

    expect(item_1.status).to eq('active')
    expect(item_1.deletion_comments).to be nil
    expect(item_2.status).to eq('active')

    click_link "Delete #{item_1.name}"

    expect(current_path).to eq("/merchants/#{merchant.id}/inventory_items/#{item_1.id}/delete_item")

    fill_in :deletion_comments, with: "Item discontiued"

    click_on "Delete Item"

    deleted_item = InventoryItem.find(item_1.id)
    expect(deleted_item.status).to eq('deleted')
    expect(deleted_item.deletion_comments).to eq("Item discontiued")
    expect(page).to have_content(deleted_item.deletion_comments)
    expect(item_2.status).to eq('active')
    expect(current_path).to eq("/merchants/#{merchant.id}/inventory_items")
    expect(page).to have_content("Successfully Deleted #{item_1.name}")
  end

  it 'can un-delete an item' do
    merchant = Merchant.create!(name: "Merchant One Name")
    item_1 = merchant.inventory_items.create!(name: "Item 1 Name", description: "Item 1 Description", price: 40.00, inventory_count: 100, status: 1, deletion_comments: "Item discontinued")
    item_2 = merchant.inventory_items.create!(name: "Item 2 Name", description: "Item 2 Description", price: 20.00, inventory_count: 200)

    visit "/merchants/#{merchant.id}/inventory_items"

    expect(item_1.status).to eq('deleted')
    expect(item_1.deletion_comments).to eq("Item discontinued")
    expect(item_2.status).to eq('active')

    click_link "Un-Delete #{item_1.name}"

    expect(current_path).to eq("/merchants/#{merchant.id}/inventory_items")

    un_deleted_item = InventoryItem.find(item_1.id)
    expect(un_deleted_item.status).to eq('active')
    expect(un_deleted_item.deletion_comments).to be nil
    expect(item_2.status).to eq('active')
    expect(page).to have_content("Successfully Undeleted #{item_1.name}")
  end
end
