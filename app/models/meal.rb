class Meal < ApplicationRecord

  has_many :recipe_line_items
  has_many :recipes, through: :recipe_line_items
  has_many :ingredient_line_items
  has_many :ingredients, through: :ingredient_line_items
end
