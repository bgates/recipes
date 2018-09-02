class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :fat
      t.float :carb
      t.float :protein
      t.float :calories
      t.float :unit_number
      t.string :unit_name
      t.float :cost
      t.string :ndbno

      t.timestamps
    end
  end
end
