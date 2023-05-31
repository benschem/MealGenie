require 'rails_helper'

RSpec.describe Meal, type: :model do
  ingredients_count = 3
  subject(:meal) { create(:meal, ingredients_count: ingredients_count) }

  it 'has a valid factory' do
    expect(meal).to be_valid
  end

  describe 'attributes' do
    it 'has a name' do
      expect(meal).to respond_to(:name)
    end

    it 'has prep time' do
      expect(meal).to respond_to(:prep_time)
    end

    it 'has serving size' do
      expect(meal).to respond_to(:servings)
    end

    it 'has instructions' do
      expect(meal).to respond_to(:instructions)
    end
  end

  describe 'validations' do
    context 'name is nil' do
      let(:meal) { build :meal, name: nil }
      it 'validates presence of name' do
        expect(meal).not_to be_valid
      end
    end

    context 'prep_time is nil' do
      let(:meal) { build :meal, prep_time: nil }
      it 'validates presence of description' do
        expect(meal).not_to be_valid
      end
    end

    context 'servings is nil' do
      let(:meal) { build :meal, servings: nil }
      it 'validates presence of amounts' do
        expect(meal).not_to be_valid
      end
    end

    context 'instructions is nil' do
      let(:meal) { build :meal, instructions: nil }
      it 'validates presence of measurement units' do
        expect(meal).not_to be_valid
      end
    end
  end

  describe 'associations' do
    it 'belongs to an order' do
      order = create(:order)
      meal.orders << order
      expect(meal.orders.first).to be_truthy
      expect(meal.orders.first).to be_a(Order)
    end

    it 'has many ingredients' do
      expect(meal.ingredients.first).to be_truthy
      expect(meal.ingredients.first).to be_a(Ingredient)
      expect(meal.ingredients.count).to eq ingredients_count
    end

    it 'destroys dependent ingredients when meal is destroyed' do
      meal = create(:meal, ingredients_count: 3)
      ingredients = meal.ingredients.to_a

      meal.destroy

      expect(Ingredient.where(id: ingredients.map(&:id))).to be_empty
    end
  end
end
