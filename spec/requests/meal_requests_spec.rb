require 'rails_helper'

RSpec.describe 'Meals', type: :request do
  subject(:meal) { create(:meal) }
  let(:order) { create(:order) }
  let(:valid_attributes) { attributes_for(:meal) }

  context '(Standalone meals)' do
    describe 'GET /meals' do
      it 'renders a successful response' do
        get standalone_meals_path
        expect(response).to be_successful
      end
    end

    describe 'GET /meals/:id' do
      it 'renders a successful response' do

        get standalone_meal_path(meal)
        expect(response).to be_successful
      end
    end

    describe 'DELETE /meals/:id' do
      it 'deletes the requested meal from the database' do
        expect {
          delete standalone_meal_path(meal)
        }.to change { Meal.exists?(meal.id) }.from(true).to(false)
      end

      it 'redirects to the meals index' do
        delete standalone_meal_path(meal)
        expect(response).to redirect_to(standalone_meals_path)
      end
    end
  end

  context '(Meals inside an order)' do
    describe 'GET /orders/:order_id/meals' do
      it 'renders a successful response' do
        create(:meal, order: order)
        get order_with_meals_path(order)
        expect(response).to be_successful
      end
    end

    describe 'GET /orders/:order_id/meals/:id' do
      it 'renders a successful response' do
        meal = create(:meal, order: order)
        get order_with_meal_path(order, meal)
        expect(response).to be_successful
      end
    end

    describe 'GET /orders/:order_id/meals/new' do
      it 'renders a successful response' do
        get new_order_with_meal_path(order)
        expect(response).to be_successful
      end
    end

    describe 'POST /orders/:order_id/meals' do
      it 'creates a new meal' do
        expect {
          post order_with_meals_path(order), params: { meal: valid_attributes }
        }.to change(Meal, :count).by(1)
      end

      it 'redirects to the order after meal is created' do
        post order_with_meals_path(order), params: { meal: valid_attributes }
        expect(response).to redirect_to(order_with_meals_path(order))
      end
    end

    describe 'DELETE /orders/:order_id/meals/:id' do
      it 'deletes the requested meal from that order' do
        meal = create(:meal, order: order)
        expect {
          delete order_with_meal_path(order, meal)
        }.to change { order.meals.count }.by(-1)
      end

      it 'does not delete the requested meal from the database' do
        meal = create(:meal, order: order)
        expect {
          delete order_with_meal_path(order, meal)
        }.not_to change { Meal.exists?(meal.id) }.from(true)
      end

      it 'redirects to the order the meal was deleted from' do
        meal = create(:meal, order: order)
        delete order_with_meal_path(order, meal)
        expect(response).to redirect_to(order_with_meals_path(order))
      end
    end
  end
end
