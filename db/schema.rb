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

ActiveRecord::Schema.define(version: 2020_03_08_195614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "access_level", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "csv_report_lines", force: :cascade do |t|
    t.text "report"
    t.date "date"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_csv_report_lines_on_account_id"
  end

  create_table "device_models", force: :cascade do |t|
    t.string "mark"
    t.string "modelName"
    t.string "modelCode"
    t.string "slotSIM"
    t.string "band"
    t.string "osMax"
    t.string "specsLink"
    t.integer "ramSize"
    t.integer "romSize"
    t.float "cpuFreqMax"
    t.integer "cores"
    t.string "screenResolution"
    t.float "screenSize"
    t.integer "mainCam"
    t.integer "secCam"
    t.integer "battery"
    t.string "usbType"
    t.date "announced"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "imei"
    t.bigint "device_model_id", null: false
    t.bigint "line_id", null: false
    t.string "status"
    t.boolean "isExternal"
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_model_id"], name: "index_devices_on_device_model_id"
    t.index ["line_id"], name: "index_devices_on_line_id"
  end

  create_table "form_options", force: :cascade do |t|
    t.string "entityName"
    t.string "optionValue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ip_phones", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.string "ipAddress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lines", force: :cascade do |t|
    t.string "number"
    t.bigint "user_id"
    t.string "status"
    t.bigint "account_id", null: false
    t.date "lastCheck"
    t.bigint "plan_id"
    t.string "sim"
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_lines_on_account_id"
    t.index ["plan_id"], name: "index_lines_on_plan_id"
    t.index ["user_id"], name: "index_lines_on_user_id"
  end

  create_table "mail_accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "email"
    t.string "pass"
    t.date "date"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_mail_accounts_on_user_id"
  end

  create_table "offices", force: :cascade do |t|
    t.bigint "office_id"
    t.string "name"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["office_id"], name: "index_offices_on_office_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.string "codeName"
    t.string "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "dni"
    t.bigint "office_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["office_id"], name: "index_users_on_office_id"
  end

  add_foreign_key "csv_report_lines", "accounts"
  add_foreign_key "devices", "device_models"
  add_foreign_key "devices", "lines"
  add_foreign_key "lines", "accounts"
  add_foreign_key "lines", "plans"
  add_foreign_key "lines", "users"
  add_foreign_key "mail_accounts", "users"
  add_foreign_key "offices", "offices"
  add_foreign_key "users", "offices"
end
