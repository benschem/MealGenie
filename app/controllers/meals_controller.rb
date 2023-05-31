class MealsController < ApplicationController
  before_action :set_order, only: %i[create]
  before_action :set_meal, only: %i[show destroy]

  def index
    # GET /orders/:id/meals
    if request.referer&.include?('order_with_meals')
      # Fetch meals associated with an order
      set_order
      @meals = @order&.meals
    else
      # GET /meals
      @meals = Meal.all
    end
  end

  # GET /orders/:order_id/meals/new
  def new
    # Build a new meal associated with the order
    @meal = Meal.new
  end

  # POST /orders/:order_id/meals
  def create
    # Create a new meal associated with the order
    @meal = @order.meals.build(meal_params)

    if @meal.save
      redirect_to order_with_meals_path(@order)
    else
      redirect_to order_path
    end
  end


  def show
    # GET /meals/:id
    # GET /orders/:order_id/meals/:id(.:format)
  end

  def destroy
    if request.original_url&.include?('orders') # request from /orders/:order_id/meals/:id
      set_order
      @meal.orders.delete(@order)
      redirect_to order_with_meals_path(@order), status: :see_other
    else # request from DELETE /meals/:id
      @meal.orders.clear
      @meal.destroy
      redirect_to standalone_meals_path, status: :see_other
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :prep_time, :servings, :instructions)
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def set_order
    @order = Order.find(params[:order_id])
  end
end
