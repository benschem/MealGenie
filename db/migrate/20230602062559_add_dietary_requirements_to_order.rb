class AddDietaryRequirementsToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :dietary_requirements, :string, array: true, default: []
  end
end
