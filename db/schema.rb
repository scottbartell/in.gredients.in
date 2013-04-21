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

ActiveRecord::Schema.define(version: 20130420224008) do

  create_table "ingredients", id: false, force: true do |t|
    t.integer  "recipe_id",                   null: false
    t.integer  "item_id",                     null: false
    t.string   "amount"
    t.string   "unit"
    t.string   "name",                        null: false
    t.boolean  "vegan",       default: false
    t.boolean  "vegetarian",  default: false
    t.boolean  "gluten_free", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["item_id"], name: "index_ingredients_on_item_id"
  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id"

  create_table "items", force: true do |t|
    t.string   "name",                        null: false
    t.boolean  "vegan",       default: false
    t.boolean  "vegetarian",  default: false
    t.boolean  "gluten_free", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["name"], name: "index_items_on_name"

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

  add_index "recipes", ["permalink"], name: "index_recipes_on_permalink", unique: true
  add_index "recipes", ["source_id"], name: "index_recipes_on_source_id"

  create_table "sources", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sources", ["name"], name: "index_sources_on_name", unique: true

end
