require 'rails_helper'

RSpec.describe 'Routes for Meals', type: :routing do
  it 'routes GET /meals to the meals controller, index action' do
    expect(get('/meals')).to route_to('meals#index')
  end

  it 'routes GET /meals/:id to the meals controller, show action' do
    expect(get('/meals/:id')).to route_to('meals#show', id: ':id')
  end

  it 'routes DELETE /meals/:id to the meals controller, destroy action' do
    expect(delete('/meals/:id')).to route_to('meals#destroy', id: ':id')
  end

  it 'routes GET /orders/:id/meals to the meals controller, index action' do
    expect(get('/orders/:order_id/meals')).to route_to('meals#index', order_id: ':order_id')
  end

  it 'routes POST /orders/:id/meals to the meals controller, create action' do
    expect(post('/orders/:order_id/meals')).to route_to('meals#create', order_id: ':order_id')
  end

  it 'routes GET /orders/:id/meals/new to the meals controller, create action' do
    expect(get('/orders/:order_id/meals/new')).to route_to('meals#new', order_id: ':order_id')
  end

  it 'routes GET /orders/:order_id/meals/:meal_id to the meals controller, show action' do
    expect(get('/orders/:order_id/meals/:meal_id')).to route_to('meals#show', order_id: ':order_id', id: ':meal_id')
  end

  it 'routes DELETE /orders/:order_id/meals/:meal_id to the meals controller, destroy action' do
    expect(delete('/orders/:order_id/meals/:meal_id')).to route_to('meals#destroy', order_id: ':order_id', id: ':meal_id')
  end
end
