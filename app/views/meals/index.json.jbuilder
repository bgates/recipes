json.array! @meals do |meal|
  json.extract! meal, :start, :title, :date, :time
  json.recipe_line_items meal.recipe_line_items do |rec|
    json.name rec.name
    json.servings rec.servings
  end
  json.ingredient_line_items meal.ingredient_line_items do |ing|
    json.name ing.name
    json.unit_name ing.unit_name
    json.unit_number ing.unit_number
  end
  json.url meal_url(meal)
end
