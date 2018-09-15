class AddReferenceSizeToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_reference :ingredients, :size_conversion
  end
end
