class RecipeLineItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :meal

  delegate :name, to: :recipe

  Ingredient::NUTRIENTS.keys.each do |nutrient|
    define_method nutrient do
      servings * recipe.send(nutrient)
    end
  end
end
