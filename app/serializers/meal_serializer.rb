class MealSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date, :time
  has_many :recipe_line_items
  has_many :ingredient_line_items
end
