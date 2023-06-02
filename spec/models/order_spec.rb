require 'rails_helper'

RSpec.describe Order, type: :model do
  subject(:order) { create(:order) }
  let(:meal) { create(:meal) }

  it 'has a valid factory' do
    expect(order).to be_valid
  end

  describe 'attributes' do
    it 'has number of meals' do
      expect(order).to respond_to(:number_of_meals)
    end

    it 'has dietary requirements' do
      expect(order).to respond_to(:dietary_requirements)
    end
  end

  # Now I'm just allowing these values to be nil,
  # because when you create a new order from the meals index
  # you won't need these values
  #
  describe 'validations' do
    context 'must specify number of meals in order' do
      let(:order) { build :order, number_of_meals: nil }
      it 'should not be valid if number_of_meals is nil' do
        expect(order).not_to be_valid
      end
    end

    context 'too many meals in order' do
      let(:order) { build :order, number_of_meals: 15 }
      it 'should not be valid if number_of_meals is greater than 14' do
        expect(order).not_to be_valid
      end
    end

    context 'user submits no dietary_requirements' do
      let(:order) { build :order, dietary_requirements: [] }
      it 'should still be valid with no dietary requirements submitted' do
        expect(order).to be_valid
      end
    end
  end

  describe 'associations' do
    it 'has many meals' do
      order.meals << meal
      expect(order.meals.first).to be_truthy
      expect(order.meals.first).to be_a(Meal)
      expect(order.meals.count).to eq 1
    end
  end
end
