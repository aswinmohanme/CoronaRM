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

ActiveRecord::Schema.define(version: 2020_03_17_060709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "patient_id"
    t.string "phone"
    t.integer "age"
    t.string "sex"
    t.string "house_name"
    t.integer "ward"
    t.string "panchayath"
    t.string "landmark"
    t.string "district"
    t.string "risk"
    t.string "previous_medical"
    t.string "symptoms"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tracking_type"
    t.integer "integer"
    t.bigint "infector_id"
    t.boolean "need_food"
    t.boolean "need_drinking_water"
    t.boolean "need_household_water"
    t.boolean "need_sanitary_napkins"
    t.boolean "need_baby_foods"
    t.string "non_med_other"
    t.boolean "need_medicines"
    t.boolean "ongoing_dialysis"
    t.boolean "ongoing_cancer_chemo_radio_therapy"
    t.string "med_other"
    t.boolean "is_non_med_req_met"
    t.boolean "is_med_req_met"
    t.text "comment"
    t.string "isolation_type"
    t.index ["infector_id"], name: "index_contacts_on_infector_id"
    t.index ["patient_id"], name: "index_contacts_on_patient_id", unique: true
  end

  create_table "medical_reqs", force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.string "requirement_type"
    t.boolean "fullfilled"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_medical_reqs_on_contact_id"
  end

  create_table "non_medical_reqs", force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.string "requirement_type"
    t.boolean "fullfilled"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_non_medical_reqs_on_contact_id"
  end

  create_table "previous_medical_conditions", force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.string "condition_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_previous_medical_conditions_on_contact_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "medical_reqs", "contacts"
  add_foreign_key "non_medical_reqs", "contacts"
  add_foreign_key "previous_medical_conditions", "contacts"
end
