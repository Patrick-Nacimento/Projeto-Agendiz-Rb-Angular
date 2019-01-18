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

ActiveRecord::Schema.define(version: 2018_11_23_144850) do

  create_table "groups", force: :cascade do |t|
    t.string "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recruiter_id"
    t.index ["recruiter_id"], name: "index_groups_on_recruiter_id"
  end

  create_table "integrations", force: :cascade do |t|
    t.string "name", null: false
    t.string "auth_key", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.boolean "active", default: true
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_integrations_on_active"
    t.index ["auth_key"], name: "index_integrations_on_auth_key"
    t.index ["created_by_id"], name: "index_integrations_on_created_by_id"
    t.index ["deleted_at"], name: "index_integrations_on_deleted_at"
    t.index ["name"], name: "index_integrations_on_name"
    t.index ["updated_by_id"], name: "index_integrations_on_updated_by_id"
  end

  create_table "interns", force: :cascade do |t|
    t.string "description"
    t.integer "age"
    t.string "telephone"
    t.string "quality"
    t.string "defect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group_id"
    t.index ["group_id"], name: "index_interns_on_group_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "description"
    t.string "cnpj"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "email", limit: 60
    t.boolean "active", default: true, null: false
    t.text "tokens"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "integrator", default: false, null: false
    t.index ["active"], name: "index_users_on_active"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
