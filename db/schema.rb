# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161204162010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_sponsors", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bill_sponsors", ["bill_id"], name: "index_bill_sponsors_on_bill_id", using: :btree
  add_index "bill_sponsors", ["sponsor_id"], name: "index_bill_sponsors_on_sponsor_id", using: :btree

  create_table "bills", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.string   "state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "party_affiliations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "party_affiliation_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "sponsors", ["party_affiliation_id"], name: "index_sponsors_on_party_affiliation_id", using: :btree

  add_foreign_key "bill_sponsors", "bills"
  add_foreign_key "bill_sponsors", "sponsors"
  add_foreign_key "sponsors", "party_affiliations"
end
