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

ActiveRecord::Schema.define(version: 20171016021817) do

  create_table "agents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uploaded_transactions", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.date "listing_date"
    t.integer "listing_price"
    t.integer "listing_agent_id"
    t.date "selling_date"
    t.integer "selling_price"
    t.integer "selling_agent_id"
    t.string "status"
    t.string "property_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_agent_id"], name: "index_uploaded_transactions_on_listing_agent_id"
    t.index ["selling_agent_id"], name: "index_uploaded_transactions_on_selling_agent_id"
  end

end
