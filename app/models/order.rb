class Order < ApplicationRecord
  has_and_belongs_to_many :meals

  validates :number_of_meals, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 14 }
end
