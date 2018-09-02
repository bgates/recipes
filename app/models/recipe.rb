class Recipe < ApplicationRecord
  has_many :ingredient_amounts, dependent: :destroy
  accepts_nested_attributes_for :ingredient_amounts
  has_many :ingredients, through: :ingredient_amounts

  Ingredient::NUTRIENTS.keys.each do |nutrient|
    define_method nutrient do
      ingredient_amounts.map(&nutrient).sum / servings
    end
  end
end
