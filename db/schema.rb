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

ActiveRecord::Schema.define(version: 20180118195504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type"
    t.integer "quantity"
    t.integer "item_id"
    t.string "item_type"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_product_categories_on_menu_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.bigint "product_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "assortment"
    t.string "street_address"
    t.string "post_code"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "restaurant_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "menus", "restaurants"
  add_foreign_key "product_categories", "menus"
  add_foreign_key "products", "product_categories"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
end
