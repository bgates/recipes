class RecipeLineItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :meal

  delegate :name, to: :recipe
end
