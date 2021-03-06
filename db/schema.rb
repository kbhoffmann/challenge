# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_16_110802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventory_items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "inventory_count"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "merchant_id"
    t.text "deletion_comments"
    t.integer "status", default: 0
    t.index ["merchant_id"], name: "index_inventory_items_on_merchant_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipment_inventory_items", force: :cascade do |t|
    t.integer "inventory_item_quantity"
    t.bigint "shipment_id"
    t.bigint "inventory_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_item_id"], name: "index_shipment_inventory_items_on_inventory_item_id"
    t.index ["shipment_id"], name: "index_shipment_inventory_items_on_shipment_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.string "customer_name"
    t.string "customer_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inventory_items", "merchants"
  add_foreign_key "shipment_inventory_items", "inventory_items"
  add_foreign_key "shipment_inventory_items", "shipments"
end
