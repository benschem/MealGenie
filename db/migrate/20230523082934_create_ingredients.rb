class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.references :meal, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :amount
      t.string :measurement_unit

      t.timestamps
    end
  end
end
