class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients, id: false do |t|
      t.integer :recipe_id, null: false
      t.integer :item_id, null: false
      t.string  :amount
      t.string  :unit

      t.string  :name,           null: false
      t.boolean :vegan,       default: false
      t.boolean :vegetarian,  default: false
      t.boolean :gluten_free, default: false

      t.index   :recipe_id
      t.index   :item_id

      t.timestamps
    end
  end
end