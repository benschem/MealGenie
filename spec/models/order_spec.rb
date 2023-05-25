require 'rails_helper'

RSpec.describe Order, type: :model do
  meals_count = 1
  subject(:order) { create(:order, meals_count: meals_count) }

  describe 'associations' do
    it 'has many meals' do
      expect(order.meals.first).to be_truthy
      expect(order.meals.first).to be_a(Meal)
      expect(order.meals.count).to eq meals_count
    end
  end
end
