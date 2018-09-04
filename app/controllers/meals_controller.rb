class MealsController < ApplicationController

  def index
    @meal = Meal.new
    @meal.recipe_line_items.build
    @recipes = Recipe.all
    respond_to do |format|
      format.html
      format.json { render json: [] }
      #  {
      #    title: 'Breakfast',
      #    start: '2018-09-03T08:00:00',
      #    end:   '2018-09-03T09:00:00'
      #  },
    end
  end

  def create
    @meal = Meal.create(meal_params)
    # options = { include: [ :recipe_line_items, :'recipe_line_items.name' ] }
    # render json: MealSerializer.new(@meal, options).serialized_json
    render json: @meal.as_json(except: [ :id, :created_at ], include: { recipe_line_items: { only: :servings, methods: :name }, ingredient_line_items: { only: [ :unit_name, :unit_number ], methods: :name } })
  end

private

  def meal_params
    params.require(:meal).permit(:date, :time, recipe_line_items_attributes: [ :recipe_id, :servings ], ingredient_line_items_attributes: [ :ingredient_id, :unit_number, :unit_name ])
  end
end
