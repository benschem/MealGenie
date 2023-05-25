class Ingredient < ApplicationRecord
  belongs_to :meal

  validates :name, presence: true
  validates :description, presence: true
  validates :amount, presence: true
  validates :measurement_unit, presence: true
end
