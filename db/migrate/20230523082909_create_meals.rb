class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.references :order, null: false, foreign_key: true
      t.string :name
      t.string :prep_time
      t.string :servings
      t.string :instructions

      t.timestamps
    end
  end
end
