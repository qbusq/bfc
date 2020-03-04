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

ActiveRecord::Schema.define(version: 2020_03_04_162013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "certificates", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_certificates", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "certificate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certificate_id"], name: "index_company_certificates_on_certificate_id"
    t.index ["user_id"], name: "index_company_certificates_on_user_id"
  end

  create_table "offer_lines", force: :cascade do |t|
    t.float "quantity_in_tons"
    t.bigint "offer_id"
    t.boolean "alternative_to_target"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "target_offer_line_id"
    t.bigint "product_id"
    t.index ["offer_id"], name: "index_offer_lines_on_offer_id"
    t.index ["product_id"], name: "index_offer_lines_on_product_id"
  end

  create_table "offers", force: :cascade do |t|
    t.date "date"
    t.date "start_date"
    t.date "end_date"
    t.string "remark"
    t.string "status"
    t.bigint "from_user_id"
    t.bigint "to_user_id"
    t.bigint "offer_request_id"
    t.bigint "follow_up_on_offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_up_on_offer_id"], name: "index_offers_on_follow_up_on_offer_id"
    t.index ["from_user_id"], name: "index_offers_on_from_user_id"
    t.index ["offer_request_id"], name: "index_offers_on_offer_request_id"
    t.index ["to_user_id"], name: "index_offers_on_to_user_id"
  end

  create_table "prod_categories", force: :cascade do |t|
    t.string "name"
    t.integer "gpc_brick"
    t.string "brick_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_certificates", force: :cascade do |t|
    t.bigint "certificate_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certificate_id"], name: "index_product_certificates_on_certificate_id"
    t.index ["product_id"], name: "index_product_certificates_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "brand"
    t.bigint "prod_category_id"
    t.bigint "user_id"
    t.boolean "private_label"
    t.float "weight_in_kg"
    t.integer "nr_per_sku"
    t.string "prod_specification_pdf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prod_category_id"], name: "index_products_on_prod_category_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "company_name"
    t.string "address"
    t.string "country"
    t.string "user_type"
    t.boolean "seller"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "offer_lines", "products"
end
