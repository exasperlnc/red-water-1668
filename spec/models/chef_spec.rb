require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  before :each do
    @chef_1 = Chef.create!(name: "Logan")
    @ingredient_1 = Ingredient.create!(name: "bread", calories: 100)
    @dish_1 = @chef_1.dishes.create!(name: "Bread", description: "It's bread")
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    @ingredient_2 = Ingredient.create!(name: "more Bread", calories: 420)
  end

  it 'returns chef ingredients' do
    expect(@chef_1.ingredient_names).to eq(["bread"])
  end
end