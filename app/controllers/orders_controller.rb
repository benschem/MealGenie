class OrdersController < ApplicationController
  before_action :set_order, only: %i[show destroy]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to order_with_meals_path(@order), notice: "Order successfully created."
    else
      render orders_path
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, status: :see_other
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:number_of_meals, dietary_requirements: [])
  end
end
