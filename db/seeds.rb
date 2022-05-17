merchant_1 = Merchant.create!(name: "Fur-ever Friends Pet Store")
merchant_1.inventory_items.create!(name: "Donut bed", description: "Large round furry donut shaped bed", price: 41.27, inventory_count: 100)
merchant_1.inventory_items.create!(name: "Whisker Likers", description: "package of Cat treats", price: 4.50, inventory_count: 300)
merchant_1.inventory_items.create!(name: "Kong", description: "rubber dog toy", price: 7.70, inventory_count: 250)

merchant_2 = Merchant.create!(name: "Candy Store")
merchant_2.inventory_items.create!(name: "Sour Patchers", description: "1 lb Gummy sour candies", price: 6.73, inventory_count: 5000)
merchant_2.inventory_items.create!(name: "Nutty Clusters", description: "1 lb Chocolate covered carmel cashew clusters", price: 8.27, inventory_count: 1500)
merchant_2.inventory_items.create!(name: "Muddy Bear", description: "1 lb Chocolate covered gummy bears", price: 6.90, inventory_count: 2500)

merchant_3 = Merchant.create!(name: "Massage Goods")
merchant_3.inventory_items.create!(name: "Sheets", description: "microfiber massage sheets", price: 30.50, inventory_count: 500)
merchant_3.inventory_items.create!(name: "Biotone massage cream", description: "deep tissue massage cream", price: 11.27, inventory_count: 2500)
merchant_3.inventory_items.create!(name: "Sacred Earth massage gel", description: "organic massage gel", price: 12.00, inventory_count: 2000)

merchant_4 = Merchant.create!(name: "Racing Central")
merchant_4.inventory_items.create!(name: "RC car tires", description: "4 pack of tires", price: 34.50, inventory_count: 1500)
merchant_4.inventory_items.create!(name: "Super RC battery", description: "1 long lasting RC car battery", price: 52.27, inventory_count: 200)
