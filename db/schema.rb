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

ActiveRecord::Schema.define(version: 2020_02_04_125148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "BasicInfos", id: :serial, force: :cascade do |t|
    t.text "photo", null: false
    t.string "name", limit: 255, null: false
    t.string "title", limit: 255, null: false
    t.text "overview", null: false
    t.datetime "dateOfBirth", null: false
    t.string "nationality", limit: 255
    t.string "status", limit: 255
    t.string "address", limit: 255
    t.string "city", limit: 255
    t.string "postalCode", limit: 255
    t.string "country", limit: 255
    t.integer "ResumeId"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.index ["ResumeId"], name: "basic_infos__resume_id", unique: true
  end

# Could not dump table "Entities" because of following StandardError
#   Unknown type '"enum_Entities_type"' for column 'type'

  create_table "Resumes", id: :serial, force: :cascade do |t|
    t.string "templateName", limit: 255
    t.string "name", limit: 255
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "UserId"
    t.index ["UserId"], name: "resumes__user_id", unique: true
  end

  create_table "SequelizeMeta", primary_key: "name", id: :string, limit: 255, force: :cascade do |t|
  end

  create_table "Skills", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "rating"
    t.datetime "createdAt", null: false
    t.integer "ResumeId"
    t.datetime "updatedAt", null: false
    t.index ["ResumeId"], name: "skills__resume_id", unique: true
  end

  create_table "Users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.string "hashed_password", limit: 255, null: false
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.index ["email"], name: "users_email", unique: true
  end

  create_table "basic_infos", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "profile_overview"
    t.date "birthdate"
    t.string "nationality"
    t.integer "gender"
    t.string "height"
    t.string "religion"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "postal_code"
    t.bigint "resume_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["resume_id"], name: "index_basic_infos_on_resume_id"
  end

  create_table "common_name_values", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.text "description", default: [], array: true
    t.string "type", null: false
    t.bigint "resume_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resume_id"], name: "index_common_name_values_on_resume_id"
    t.index ["type"], name: "index_common_name_values_on_type"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "type", null: false
    t.string "value", null: false
    t.bigint "resume_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resume_id"], name: "index_contacts_on_resume_id"
  end

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.date "since"
    t.date "upuntil"
    t.boolean "current", default: false
    t.text "description", default: [], array: true
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "postal_code"
    t.string "phone"
    t.string "email"
    t.string "type", null: false
    t.bigint "resume_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.index ["resume_id"], name: "index_entities_on_resume_id"
    t.index ["type"], name: "index_entities_on_type"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "name"
    t.string "template_name"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sharing_code"
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "BasicInfos", "\"Resumes\"", column: "ResumeId", name: "BasicInfos_ResumeId_fkey"
  add_foreign_key "Entities", "\"Resumes\"", column: "ResumeId", name: "Entities_ResumeId_fkey"
  add_foreign_key "Resumes", "\"Users\"", column: "UserId", name: "Resumes_UserId_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Skills", "\"Resumes\"", column: "ResumeId", name: "Skills_ResumeId_fkey"
end
