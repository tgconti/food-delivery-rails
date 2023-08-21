class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  # The 7 CRUDs

  def index
    @orders = Order.where(user: current_user)
    @orders = current_user.orders
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @rider = Rider.find(params[:rider_id])
    @order = Order.new
    @order.user = current_user
    @order.item = @meal
    @order.price = @meal.price
    @order.rider = @rider
    @order.save
    redirect_to order_path(@order), notice: 'Order was successfully created.'

  end

  def new
    @order = Order.new
  end

  def show
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to orders_path, notice: 'Delivered status was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: 'Order deleted successfully.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:delivered)
  end
end
