class IngredientAmount < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  Ingredient::NUTRIENTS.keys.each do |nutrient|
    define_method nutrient do
      unit_number * size_conversion * ingredient.send(nutrient) / 100
    end
  end

  def size_conversion
    ingredient.grams_in(unit_name)
  end
  # ingredient_amount has unit_number, unit_name, ingredient_id
  # size_conversion has unit, amount, gram_equivalent, ingredient_id
end
