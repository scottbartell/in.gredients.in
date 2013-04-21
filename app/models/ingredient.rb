class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :item
end
  after_initialize :copy_item

  private

  def copy_item
    item = self.item
    self.name = item.name
    self.vegan = item.vegan
    self.vegetarian = item.vegetarian
    self.gluten_free = item.gluten_free
  end
end