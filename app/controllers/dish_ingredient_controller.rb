class DishIngredientController < ApplicationController
  def create
    @dish = Dish.find(params[:dish_id])
    @dish_ingredient = DishIngredient.create!(dish_ingredient_params)
    redirect_to dish_path(@dish.id)
  end

  private
  def dish_ingredient_params
    params.permit(:dish_id, :ingredient_id)
  end
end