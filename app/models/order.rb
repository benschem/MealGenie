class Order < ApplicationRecord
  has_many :meals
  has_many :ingredients, through: :meals
end
