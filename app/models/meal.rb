class Meal < ApplicationRecord

  has_and_belongs_to_many :orders
  before_destroy :remove_from_orders
  has_many :ingredients, dependent: :destroy

  validates :name, presence: true
  validates :prep_time, presence: true
  validates :servings, presence: true
  validates :instructions, presence: true

  private

  def remove_from_orders
    orders.each do |order|
      puts "Removing meal #{id} from order #{order.id}"
      order.meals.delete(self)
    end
  end
end
