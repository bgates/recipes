class AddCookingTimeToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :cooking_time, :integer
  end
end
