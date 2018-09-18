class MealsController < ApplicationController
  layout proc {|controller| controller.request.xhr? ? false: "application" }
  before_action :find_meal, only: [ :show, :destroy ]

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
  end

  def show
  end

  def destroy
    @meal.destroy
    render json: @meal
  end

private

  def find_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:date, :time, recipe_line_items_attributes: [ :recipe_id, :servings ], ingredient_line_items_attributes: [ :ingredient_id, :unit_number, :unit_name ])
  end
end
