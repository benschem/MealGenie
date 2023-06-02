require 'rails_helper'

RSpec.describe 'Routes for Orders', type: :routing do
  it 'routes GET /orders to the orders controller, index action' do
    expect(get('/orders')).to route_to('orders#index')
  end

  it 'routes GET /orders/:id to the orders controller, show action' do
    expect(get('/orders/:id')).to route_to('orders#show', id: ':id')
  end

  it 'routes POST /orders to the orders controller, create action' do
    expect(post('/orders')).to route_to('orders#create')
  end

  it 'routes GET /orders/new to the orders controller, new action' do
    expect(get('/orders/new')).to route_to('orders#new')
  end

  it 'routes DELETE /orders/:id to the orders controller, destroy action' do
    expect(delete('/orders/:id')).to route_to('orders#destroy', id: ':id')
  end
end
