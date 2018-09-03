class MealsController < ApplicationController

  def index
    @meal = Meal.new
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
end
