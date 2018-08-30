class AddQuantitiesToSizeConversions < ActiveRecord::Migration[5.2]
  def change
    rename_column :size_conversions, :label, :unit
    add_column :size_conversions, :amount, :float
  end
end
