class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]

  # The 7 CRUDs

  def index
    @meal = Meal.all
  end

  def create
    @meal = Meal.new
  end

  def new
    @meal = Meal.new(meal_params)
  end

  def show
  end

  def edit
  end

  def update
    @meal.update(meal_params)
    redirect_to meal_path, notice: 'Meal was successfully updated.'
  end

  def destroy
    @meal.destroy
    redirect_to meals_path, notice: 'Meal was successfully destroyed.'
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :description, :price)
  end
end
