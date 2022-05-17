require 'rails_helper'

RSpec.describe 'Merchant Inventory Items Edit' do
  it 'has a preloaded form to edit merchant item information' do
    merchant_1 = Merchant.create!(name: "Merchant One Name")
    item_1 = merchant_1.inventory_items.create!(name: "Item 1 Name", description: "Item 1 Description", price: 40.00, inventory_count: 100)
    item_2 = merchant_1.inventory_items.create!(name: "Item 2 Name", description: "Item 2 Description", price: 20.00, inventory_count: 200)

    visit "/merchants/#{merchant_1.id}/inventory_items"

    click_link "Edit Details for #{item_1.name}"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/inventory_items/#{item_1.id}/edit")

    expect(page).to have_field(:name, with: item_1.name)
    expect(page).to have_field(:description, with: item_1.description)
    expect(page).to have_field(:inventory_count, with: item_1.inventory_count)
    expect(page).to have_field(:price, with: item_1.price)

    fill_in :name, with: "New Item Name"
    fill_in :description, with: "New Item Description"
    fill_in :inventory_count, with: 50
    fill_in :price, with: 60.00
    click_on "Edit Item"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/inventory_items")

    expect(page).to have_content("New Item Name")
    expect(page).to have_content("Item 2 Name")
    expect(page).to have_content("New Item Description")
    expect(page).to have_content("Successfully Updated Item")
    expect(page).to_not have_content("Item 1 Name")
  end

  it 'shows an error if the fields are not filled out correctly' do
    merchant = Merchant.create!(name: "Merchant One Name")
    item = merchant.inventory_items.create!(name: "Item 1 Name", description: "Item 1 Description", price: 40.00, inventory_count: 100)

    visit "/merchants/#{merchant.id}/inventory_items/#{item.id}/edit"

    fill_in :inventory_count, with: -50

    click_on("Edit Item")

    expect(page).to have_content("Item not updated")
    expect(current_path).to eq("/merchants/#{merchant.id}/inventory_items/#{item.id}/edit")
  end
end
