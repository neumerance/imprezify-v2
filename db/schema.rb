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

ActiveRecord::Schema.define(version: 2020_02_26_150821) do

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
    t.integer "support_type", default: 0
    t.boolean "sent_feedback", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
