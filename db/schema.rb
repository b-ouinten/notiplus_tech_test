# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_25_234752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brand_accounts", force: :cascade do |t|
    t.bigint "brand_company_id"
    t.string "label", null: false
    t.string "siret_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_company_id"], name: "index_brand_accounts_on_brand_company_id"
  end

  create_table "brand_companies", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "label", null: false
    t.string "siren_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_brand_companies_on_owner_id"
  end

  create_table "brand_members", force: :cascade do |t|
    t.bigint "brand_account_id"
    t.bigint "user_account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_account_id"], name: "index_brand_members_on_brand_account_id"
    t.index ["user_account_id"], name: "index_brand_members_on_user_account_id"
  end

  create_table "user_accounts", force: :cascade do |t|
    t.string "email"
    t.string "auth0_uid"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_user_accounts_on_email", unique: true
  end

  add_foreign_key "brand_accounts", "brand_companies"
  add_foreign_key "brand_companies", "user_accounts", column: "owner_id"
end
