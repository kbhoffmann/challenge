require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'shows all of the merchant names as links to their show pages' do
    merchant_1 = Merchant.create!(name: "Merchant One Name")
    merchant_2 = Merchant.create!(name: "Merchant Two Name")

    visit '/'

    expect(page).to have_link("#{merchant_1.name}")
    expect(page).to have_link("#{merchant_2.name}")

    click_on "#{merchant_1.name}"

    expect(current_path).to eq("/merchants/#{merchant_1.id}")
    expect(current_path).to_not eq("/merchants/#{merchant_2.id}")
  end
end
