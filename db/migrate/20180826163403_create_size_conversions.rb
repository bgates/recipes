class CreateSizeConversions < ActiveRecord::Migration[5.2]
  def change
    create_table :size_conversions do |t|
      t.references :ingredient, foreign_key: true
      t.string :label
      t.float :gram_equivalent

      t.timestamps
    end
  end
end
