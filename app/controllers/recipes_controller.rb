class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipe.ingredient_amounts.build
  end

  def create
    @recipe = Recipe.create(recipe_params)
    render layout: false
  end

  def index
    @recipes = Recipe.all
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :time, :cooking_time, :instructions, :servings, ingredient_amounts_attributes: [ :ingredient_id, :unit_name, :unit_number ])
  end
end
