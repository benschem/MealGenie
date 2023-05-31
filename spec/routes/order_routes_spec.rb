require 'rails_helper'

RSpec.describe 'Routes for Orders', type: :routing do
  it 'routes /orders to the orders controller, index action' do
    expect(get('/orders')).to route_to('orders#index')
  end

  it 'routes /orders/:id to the orders controller, show action' do
    expect(get('/orders/:id')).to route_to('orders#show', id: ':id')
  end

  it 'routes /orders/:id/meals to the meals controller, index action' do
    expect(get('/orders/:id/meals')).to route_to('meals#index', order_id: ':id')
  end

  it 'routes /orders/:order_id/meals/:meal_id to the meals controller, show action' do
    expect(get('/orders/:order_id/meals/:meal_id')).to route_to('meals#show', order_id: ':order_id', id: ':meal_id')
  end
end
