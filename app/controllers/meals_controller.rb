class MealsController < ApplicationController

  def index
    @meal = Meal.new
    @recipes = Recipe.all
  end
end
