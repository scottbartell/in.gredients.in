class Item < ActiveRecord::Base
  has_many :ingredients
  has_many :recipes, through: :ingredients

  validates_presence_of :name

  def recipes
    Ingredient.where(item: self).map{|i| i.recipe}
  end

end
