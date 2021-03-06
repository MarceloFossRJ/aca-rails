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

ActiveRecord::Schema.define(version: 20170717202334) do

  create_table "aca_rails_user_versions", force: :cascade do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 1073741823
    t.datetime "created_at"
    t.string   "object_changes"
    t.index ["item_type", "item_id"], name: "index_aca_rails_user_versions_on_item_type_and_item_id"
  end

  create_table "aca_rails_users", force: :cascade do |t|
    t.string   "name"
    t.string   "login"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_admin"
    t.boolean  "is_active"
    t.datetime "last_login"
    t.string   "last_ip"
    t.integer  "login_attempts"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_locked"
    t.datetime "locked_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "welcome_mail_sent_at"
    t.datetime "email_confirmation_sent_at"
    t.boolean  "is_email_confirmed"
  end

end
