class Item < ActiveRecord::Base
  has_many :ingredients
  has_many :recipes, through: :ingredients

  validates_presence_of :name

  def recipes
    Ingredient.where(item: self).map{|i| i.recipe}
  end

  def self.top_10
    counted = Item.count('name', group: :name)
    counted.sort_by {|key, value| value}.reverse[0..10]
  end
end
