class CreateIngredientAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_amounts do |t|
      t.float :unit_number
      t.string :unit_name
      t.references :ingredient, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
