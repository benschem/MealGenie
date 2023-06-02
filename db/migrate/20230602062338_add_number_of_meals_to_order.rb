class AddNumberOfMealsToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :number_of_meals, :integer
  end
end
