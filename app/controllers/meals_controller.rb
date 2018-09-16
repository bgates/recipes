class MealsController < ApplicationController

  def index
    @meal = Meal.new
    @meal.recipe_line_items.build
    @recipes = Recipe.all
    @meals = Meal.this_week
    respond_to do |format|
      format.html
      format.json { render json: @meals.map(&:for_calendar) }
    end
  end

  def create
    @meal = Meal.create(meal_params)
    render json: @meal.for_calendar
  end

private

  def meal_params
    params.require(:meal).permit(:date, :time, recipe_line_items_attributes: [ :recipe_id, :servings ], ingredient_line_items_attributes: [ :ingredient_id, :unit_number, :unit_name ])
  end
end
