# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171214230552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "identification_card"
    t.string   "gender"
    t.string   "phone"
    t.string   "email"
    t.date     "birthday"
    t.text     "address"
    t.string   "country"
    t.string   "province"
    t.string   "city"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.string   "rate_name"
    t.integer  "sessions"
    t.integer  "service_id"
    t.integer  "days_expire"
    t.decimal  "price"
    t.decimal  "discount"
    t.string   "type"
    t.boolean  "state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "memberships", ["service_id"], name: "index_memberships_on_service_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "purchase_price"
    t.decimal  "sale_price"
    t.integer  "quantity"
    t.integer  "minimun_quantity"
    t.decimal  "gain"
    t.integer  "provider_id"
    t.string   "type"
    t.boolean  "state"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "products", ["provider_id"], name: "index_products_on_provider_id", using: :btree

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "ruc"
    t.string   "phone"
    t.text     "address"
    t.string   "email"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_details", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "price"
    t.decimal  "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number"
  end

  add_index "sale_details", ["product_id"], name: "index_sale_details_on_product_id", using: :btree
  add_index "sale_details", ["sale_id"], name: "index_sale_details_on_sale_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.date     "date"
    t.integer  "client_id"
    t.integer  "user_id"
    t.decimal  "subtotal"
    t.decimal  "iva"
    t.decimal  "total_effective"
    t.decimal  "total_card"
    t.decimal  "total_checks"
    t.decimal  "total"
    t.text     "nota"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "state"
    t.integer  "number"
  end

  add_index "sales", ["client_id"], name: "index_sales_on_client_id", using: :btree
  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "identification_card"
    t.text     "address"
    t.date     "birthday"
    t.string   "phone"
    t.date     "contract_date"
    t.date     "contract_date_end"
    t.string   "position"
    t.string   "state"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "memberships", "services"
  add_foreign_key "products", "providers"
  add_foreign_key "sale_details", "products"
  add_foreign_key "sale_details", "sales"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "users"
end
