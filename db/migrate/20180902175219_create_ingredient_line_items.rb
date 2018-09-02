class CreateIngredientLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_line_items do |t|
      t.references :ingredient, foreign_key: true
      t.references :meal, foreign_key: true
      t.string :unit_name
      t.float :unit_number

      t.timestamps
    end
  end
end
