class CreateMealsRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :meals_recipes do |t|
      t.references :meal, foreign_key: true
      t.references :recipe, foreign_key: true
    end
  end
end
