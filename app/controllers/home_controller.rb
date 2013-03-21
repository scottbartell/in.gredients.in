class HomeController < ApplicationController
  def index
    if params[:q].present?
      @recipes = RecipePuppy::Recipe.with_ingredients(params[:q]).get["results"]
    end
  end
end
