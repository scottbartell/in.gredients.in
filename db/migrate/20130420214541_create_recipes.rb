class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string   :name
      t.integer  :source_id
      t.string   :source_url
      t.string   :permalink, limit: 128, null: false
      t.string   :image_name
      t.decimal  :base_rating, precision: 4, scale: 1
      t.boolean  :vegan,       default: false
      t.boolean  :vegetarian,  default: false
      t.boolean  :gluten_free, default: false
      t.boolean  :paleo,       default: false
      t.datetime :published_at
      t.index    :permalink, unique: true
      t.index    :source_id

      t.timestamps
    end
  end
end
