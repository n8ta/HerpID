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

ActiveRecord::Schema.define(version: 2019_05_22_220714) do

  create_table "common_names", force: :cascade do |t|
    t.integer "species_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["species_id"], name: "index_common_names_on_species_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.integer "superfamily_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["superfamily_id"], name: "index_families_on_superfamily_id"
  end

  create_table "genera", force: :cascade do |t|
    t.string "name", null: false
    t.integer "family_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_genera_on_family_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "species_id", null: false
    t.string "image_path", null: false
    t.bigint "seen", default: 0, null: false
    t.bigint "correct", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["species_id"], name: "index_photos_on_species_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.string "image_path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions_species", id: false, force: :cascade do |t|
    t.integer "species_id", null: false
    t.integer "region_id", null: false
  end

  create_table "species", force: :cascade do |t|
    t.integer "genus_id"
    t.string "name", null: false
    t.boolean "venomous", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genus_id"], name: "index_species_on_genus_id"
  end

  create_table "superfamilies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_species_data", force: :cascade do |t|
    t.integer "species_id", null: false
    t.integer "user_id", null: false
    t.bigint "seen", default: 0, null: false
    t.bigint "correct", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["species_id"], name: "index_user_species_data_on_species_id"
    t.index ["user_id"], name: "index_user_species_data_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
