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

ActiveRecord::Schema.define(version: 2020_12_16_105237) do

  create_table "orders", force: :cascade do |t|
    t.string "address"
    t.datetime "date"
    t.boolean "fixed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "manager_id"
    t.integer "fixer_id"
    t.integer "customer_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["fixer_id"], name: "index_orders_on_fixer_id"
    t.index ["manager_id"], name: "index_orders_on_manager_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.boolean "manager", default: false
    t.boolean "fixer", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "users", column: "customer_id"
  add_foreign_key "orders", "users", column: "fixer_id"
  add_foreign_key "orders", "users", column: "manager_id"
end
