class IngredientLineItem < ApplicationRecord
  belongs_to :ingredient
  belongs_to :meal

  delegate :name, to: :ingredient
end
