require 'rails_helper'

RSpec.describe Order, type: :model do
  subject(:order) { create(:order) }
  let(:meal) { create(:meal) }

  describe 'associations' do
    it 'has many meals' do
      order.meals << meal
      expect(order.meals.first).to be_truthy
      expect(order.meals.first).to be_a(Meal)
      expect(order.meals.count).to eq 1
    end
  end
end
