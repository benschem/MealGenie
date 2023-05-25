class Meal < ApplicationRecord
  has_and_belongs_to_many :orders
  has_many :ingredients

  validates :name, presence: true
  validates :prep_time, presence: true
  validates :servings, presence: true
  validates :instructions, presence: true
end
