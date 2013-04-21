class HomeController < ApplicationController
  before_action :set_item, only: [:index]
  def index
    if params[:q].present?
      #@recipes = RecipePuppy::Recipe.with_ingredients(params[:q]).get["results"]
      @recipes = @item.recipes
    end
  end

  private
    def set_item
      @item = Item.find_by name: params[:q]
      @item = [] unless @item
    end
end
