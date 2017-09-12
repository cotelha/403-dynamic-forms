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

ActiveRecord::Schema.define(version: 20170912183438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_fields", force: :cascade do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required"
    t.integer  "product_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "product_fields", ["product_type_id"], name: "index_product_fields_on_product_type_id", using: :btree

  create_table "product_properties", force: :cascade do |t|
    t.string   "data"
    t.integer  "product_field_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_properties", ["product_field_id"], name: "index_product_properties_on_product_field_id", using: :btree
  add_index "product_properties", ["product_id"], name: "index_product_properties_on_product_id", using: :btree

  create_table "product_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "product_type_id"
    t.text     "properties"
  end

end
