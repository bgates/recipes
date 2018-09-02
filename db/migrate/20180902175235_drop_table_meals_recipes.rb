class DropTableMealsRecipes < ActiveRecord::Migration[5.2]
  def change
    drop_table :meals_recipes
  end
end
