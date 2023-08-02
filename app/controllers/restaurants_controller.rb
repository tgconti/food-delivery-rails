class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # The 7 CRUDs

  def index
    @restaurant = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new
  end

  def new
    @restaurant = Restaurant.new(restaurant_params)
  end

  def show
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    # redirect_to restaurant_path, notice: 'Restaurant was successfully updated.'

  end

  def destroy
    @restaurant.destroy
    # redirect_to restaurants_path, notice: 'Credit card was successfully destroyed.'

  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :zipcode, :rating )
  end
end
