require 'rails_helper'

RSpec.describe "dish show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Logan")
    @dish_1 = @chef_1.dishes.create!(name: "Bread", description: "It's bread")
    @ingredient_1 = Ingredient.create!(name: "bread", calories: 100)
  end
  it "show's dishes name, calories description" do
    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content("#{@dish_1.name}")
    expect(page).to have_content("#{@dish_1.description}")
    expect(page).to have_content("#{@dish_1.total_calories}")
  end
end