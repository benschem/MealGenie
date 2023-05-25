class CreateJoinTableOrderMeal < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders, :meals do |t|
      t.index [:order_id, :meal_id]
      t.index [:meal_id, :order_id]
    end
  end
end
