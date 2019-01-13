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

ActiveRecord::Schema.define(version: 2019_01_13_172109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.bigint "carts_id"
    t.bigint "products_id"
    t.decimal "price"
    t.integer "qty_products"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carts_id"], name: "index_cart_items_on_carts_id"
    t.index ["products_id"], name: "index_cart_items_on_products_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "users_id"
    t.decimal "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_carts_on_users_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.decimal "price", default: "0.0"
    t.integer "qty_available", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cart_items", "carts", column: "carts_id"
  add_foreign_key "cart_items", "products", column: "products_id"
  add_foreign_key "carts", "users", column: "users_id"
end
