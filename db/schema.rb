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

ActiveRecord::Schema.define(version: 2020_03_03_111750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.float "full_truck_price_per_kg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "target_offer_line_id"
    t.index ["offer_id"], name: "index_offer_lines_on_offer_id"
  end

  create_table "offers", force: :cascade do |t|
    t.date "date"
    t.date "start_date"
    t.date "end_date"
    t.string "remark"
    t.string "status"
    t.bigint "from_user_id"
    t.bigint "to_user_id"
    t.bigint "offer_request_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "from_user"
    t.integer "to_user"
    t.integer "offer_request_id"
    t.index ["from_user_id"], name: "index_offers_on_from_user_id"
    t.index ["offer_request_id_id"], name: "index_offers_on_offer_request_id_id"
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

end
