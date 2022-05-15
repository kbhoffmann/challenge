merchant_1 = Merchant.create!(name: "Fur-ever Friends Pet Store")
merchant_1.inventory_items.create!(name: "Donut bed", description: "Large round furry donut shaped bed", price: 41.27, inventory_count: 100)
merchant_1.inventory_items.create!(name: "Whisker Likers", description: "Cat treats", price: 4.55, inventory_count: 200)

merchant_2 = Merchant.create!(name: "Candy Store")
merchant_2.inventory_items.create!(name: "Sour Patchers", description: "Gummy sour candies", price: 3.73, inventory_count: 500)
merchant_2.inventory_items.create!(name: "Nutty Clusters", description: "Chocolate covered carmel cashew clusters", price: 8.27, inventory_count: 50)
