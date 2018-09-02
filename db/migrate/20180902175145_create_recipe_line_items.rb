class CreateRecipeLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_line_items do |t|
      t.references :recipe, foreign_key: true
      t.references :meal, foreign_key: true
      t.float :servings

      t.timestamps
    end
  end
end
