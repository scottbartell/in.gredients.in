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

ActiveRecord::Schema.define(version: 20130421055817) do

  create_table "ingredients", force: true do |t|
    t.integer  "recipe_id",  null: false
    t.integer  "item_id",    null: false
    t.string   "amount"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["item_id"], name: "ingredients_item_id_index"
  add_index "ingredients", ["recipe_id"], name: "ingredients_recipe_id_index"

  create_table "items", force: true do |t|
    t.string   "name",                        null: false
    t.boolean  "vegan",       default: false
    t.boolean  "vegetarian",  default: false
    t.boolean  "gluten_free", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["name"], name: "items_name_index"

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.integer  "source_id"
    t.string   "source_url"
    t.string   "permalink",    limit: 128,                                         null: false
    t.string   "image_name"
    t.decimal  "base_rating",              precision: 4, scale: 1
    t.boolean  "vegan",                                            default: false
    t.boolean  "vegetarian",                                       default: false
    t.boolean  "gluten_free",                                      default: false
    t.boolean  "paleo",                                            default: false
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sources", ["name"], name: "sources_name_index", unique: true

end
