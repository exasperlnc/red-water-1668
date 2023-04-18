require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  before :each do
    @chef_1 = Chef.create!(name: "Logan")
    @ingredient_1 = Ingredient.create!(name: "bread", calories: 100)
    @dish_1 = @chef_1.dishes.create!(name: "Bread", description: "It's bread")
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
  end

  it 'totals calories' do
    expect(@dish_1.total_calories).to eq(100)
  end

  it 'gives chef name' do
    expect(@dish_1.chef_name).to eq("Logan")
  end
end