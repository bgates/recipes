class Meal < ApplicationRecord

  has_many :recipe_line_items, dependent: :destroy
  accepts_nested_attributes_for :recipe_line_items
  has_many :recipes, through: :recipe_line_items
  has_many :ingredient_line_items, dependent: :destroy
  accepts_nested_attributes_for :ingredient_line_items
  has_many :ingredients, through: :ingredient_line_items
end
