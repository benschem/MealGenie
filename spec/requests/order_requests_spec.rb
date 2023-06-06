require "rails_helper"

RSpec.describe "Orders", type: :request do
  subject(:order) { create(:order) }
  let(:valid_attributes) { attributes_for(:order) }

  describe "GET /orders" do
    it "renders a successful response" do
      get orders_path
      expect(response).to be_successful
    end
  end

  describe "GET /orders/:id" do
    it "renders a successful response" do
      get order_with_meals_path(order.id)
      expect(response).to be_successful
    end
  end

  describe "GET /orders/new" do
    it "renders a successful response" do
      get new_order_path
      expect(response).to be_successful
    end
  end

  describe "POST /orders" do
    it "creates a new Order" do
      expect {
        post orders_path, params: { order: valid_attributes }
      }.to change(Order, :count).by(1)
    end

    it "redirects to the created order if succesful" do
      post orders_path, params: { order: valid_attributes }
      expect(response).to redirect_to(order_with_meals_path(Order.last))
    end
  end

  describe "DELETE /orders/:id" do
    it "destroys the requested order" do
      expect {
        delete order_path(order)
      }.to change { Order.exists?(order.id) }.from(true).to(false)
    end

    it 'does not delete any associated meals from the database' do
      create(:meal, order: order)
      expect {
        delete order_path(order)
      }.to change(Meal, :count).by(0)
    end

    it "redirects to the orders list" do
      delete order_path(order)
      expect(response).to redirect_to(orders_path)
    end
  end
end
