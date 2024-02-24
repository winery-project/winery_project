# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_02_19_073815) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "amount", default: 1, null: false
    t.integer "wine_id"
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_cart_items_on_customer_id"
    t.index ["wine_id"], name: "index_cart_items_on_wine_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.text "introduction", null: false
    t.string "phone_number", null: false
    t.string "email", null: false
    t.boolean "is_active", default: true, null: false
    t.integer "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_companies_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "name", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_deliveries_on_customer_id"
  end

  create_table "favorite_companies", force: :cascade do |t|
    t.integer "company_id"
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_favorite_companies_on_company_id"
    t.index ["customer_id"], name: "index_favorite_companies_on_customer_id"
  end

  create_table "favorite_wines", force: :cascade do |t|
    t.integer "wine_id"
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_favorite_wines_on_customer_id"
    t.index ["wine_id"], name: "index_favorite_wines_on_wine_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "amount", null: false
    t.integer "taxed_price", null: false
    t.integer "status", default: 0, null: false
    t.integer "wine_id"
    t.integer "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["wine_id"], name: "index_order_details_on_wine_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "delivery_name", null: false
    t.string "delivery_address", null: false
    t.string "delivery_postal_code", null: false
    t.integer "total_price", null: false
    t.integer "payment_method", default: 0, null: false
    t.integer "shipping_cost", null: false
    t.integer "status", default: 0, null: false
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "wine_comments", force: :cascade do |t|
    t.text "comment", null: false
    t.integer "wine_id"
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_wine_comments_on_customer_id"
    t.index ["wine_id"], name: "index_wine_comments_on_wine_id"
  end

  create_table "wines", force: :cascade do |t|
    t.string "name", null: false
    t.text "introduction", null: false
    t.integer "maturity", null: false
    t.integer "fruity", null: false
    t.integer "flavor", null: false
    t.integer "bitter", null: false
    t.integer "smooth", null: false
    t.integer "aftertaste", null: false
    t.integer "price", null: false
    t.boolean "is_sold", default: true, null: false
    t.integer "genre_id"
    t.integer "company_id"
    t.integer "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_wines_on_company_id"
    t.index ["country_id"], name: "index_wines_on_country_id"
    t.index ["genre_id"], name: "index_wines_on_genre_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_items", "customers"
  add_foreign_key "cart_items", "wines"
  add_foreign_key "companies", "countries"
  add_foreign_key "deliveries", "customers"
  add_foreign_key "favorite_companies", "companies"
  add_foreign_key "favorite_companies", "customers"
  add_foreign_key "favorite_wines", "customers"
  add_foreign_key "favorite_wines", "wines"
  add_foreign_key "order_details", "orders"
  add_foreign_key "order_details", "wines"
  add_foreign_key "orders", "customers"
  add_foreign_key "wine_comments", "customers"
  add_foreign_key "wine_comments", "wines"
  add_foreign_key "wines", "companies"
  add_foreign_key "wines", "countries"
  add_foreign_key "wines", "genres"
end
