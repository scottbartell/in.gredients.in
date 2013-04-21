class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name,           null: false
      t.boolean :vegan,       default: false
      t.boolean :vegetarian,  default: false
      t.boolean :gluten_free, default: false
      t.index   :name

      t.timestamps
    end
  end
end
