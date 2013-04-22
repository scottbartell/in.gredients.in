class HomeController < ApplicationController
  before_action :set_items, only: [:index]
  def index
    if params[:q].present?
      #@recipes = RecipePuppy::Recipe.with_ingredients(params[:q]).get["results"]
      @recipes = self.recipes_by_items[0..10]
    end
  end


  def recipes_by_items
    recipes = []
    @items.each do |item|
      recipes << item.recipes
      if recipes.flatten.length > 20
        break
      end
    end
    @recipes = recipes.flatten
  end

  private
    def set_items
      if params[:q].present?
        @items = Item.where("name like ?", "%#{params[:q].singularize}%")
        @items = [] unless @items
      end
    end
end
