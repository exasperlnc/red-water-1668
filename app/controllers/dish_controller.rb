class DishController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  private
  def dish_params
    params.permit(:name, :description)
  end
end