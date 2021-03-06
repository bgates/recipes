class IngredientsController < ApplicationController
  layout proc {|controller| controller.request.xhr? ? false: "application" }
  protect_from_forgery except: :search

  def index
    @ingredients = Ingredient.includes(:serving_size, :size_conversions).all
  end

  def minerals
    @ingredients = Ingredient.all
  end

  def vitamins
    @ingredients = Ingredient.all
  end

  def edit
    @ingredient = Ingredient.includes(:size_conversions).find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to ingredients_url
  end

  def search
    search_response = NutritionApi.search(params[:search])
    @results = search_response[:items]
    respond_to do |format|
      format.js do
        if @results.nil?
          @ingredient = Ingredient.new
          render template: 'ingredients/new.html.erb'
        else
          render template: 'ingredients/search.html.erb' 
        end
      end
    end
  end

  def create
    search_response = NutritionApi.find(params[:id])
    ingredient_hash = search_response["foods"][0]["food"]
    ingredient = Ingredient.create_with_sizes(ingredient_hash)
    respond_to do |format|
      format.html { redirect_to search_ingredients_url, success: "#{ingredient.name} added" }
      format.json { render json: { name: ingredient.name, id: ingredient.id, conversions: ingredient.size_conversions.pluck(:unit) } }
    end
  end

private

  def ingredient_params
    params.require(:ingredient).permit(:name, :size_conversion_id, size_conversions_attributes: [ :unit, :gram_equivalent, :amount ])
  end
end

