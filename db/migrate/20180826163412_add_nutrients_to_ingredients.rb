class AddNutrientsToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :fiber, :float
    add_column :ingredients, :sugar, :float
    add_column :ingredients, :calcium, :float
    add_column :ingredients, :iron, :float
    add_column :ingredients, :magnesium, :float
    add_column :ingredients, :phosphorus, :float
    add_column :ingredients, :potassium, :float
    add_column :ingredients, :sodium, :float
    add_column :ingredients, :zinc, :float
    add_column :ingredients, :vitamin_c, :float
    add_column :ingredients, :thiamin, :float
    add_column :ingredients, :riboflavin, :float
    add_column :ingredients, :niacin, :float
    add_column :ingredients, :vitamin_b6, :float
    add_column :ingredients, :folate, :float
    add_column :ingredients, :vitamin_b12, :float
    add_column :ingredients, :vitamin_a, :float
    add_column :ingredients, :vitamin_e, :float
    add_column :ingredients, :vitamin_d, :float
    add_column :ingredients, :vitamin_k, :float
    add_column :ingredients, :saturated_fat, :float
    add_column :ingredients, :monounsaturated_fat, :float
    add_column :ingredients, :polyunsaturated_fat, :float
    add_column :ingredients, :trans_fat, :float
    add_column :ingredients, :cholesterol, :float
  end
end
