class MealsController < ApplicationController

  def index
    @meal = Meal.new
    @meal.recipe_line_items.build
    @recipes = Recipe.all
    @meals = Meal.for_week(params[:start], params[:end]).includes(:recipes, :ingredients)
    respond_to do |format|
      format.html { @meals_by_date = @meals.group_by{|meal| Date::DAYNAMES[meal.date.wday] } }
      format.json
    end
  end

  def create
    @meal = Meal.create(meal_params)
    render json: @meal.for_calendar
  end

  def show
    @meal = Meal.find(params[:id])
  end
private

  def meal_params
    params.require(:meal).permit(:date, :time, recipe_line_items_attributes: [ :recipe_id, :servings ], ingredient_line_items_attributes: [ :ingredient_id, :unit_number, :unit_name ])
  end
end
