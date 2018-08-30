class AddNutritionDbIdToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :ndbno, :integer
  end
end
