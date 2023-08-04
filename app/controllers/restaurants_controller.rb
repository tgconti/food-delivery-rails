class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  # The 7 CRUDs

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path, notice: 'Restaurant created successfully.'
    else
      render :new, status: :unprocessable_entity, notice: 'Failed to create'
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path, notice: 'Restaurant was successfully updated.'
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, notice: 'Restaurant was successfully destroyed.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :zipcode, :rating)
  end

end
