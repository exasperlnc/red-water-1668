require 'rails_helper'

RSpec.describe "chef#show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Logan")
    @ingredient_1 = Ingredient.create!(name: "bread", calories: 100)
    @dish_1 = @chef_1.dishes.create!(name: "Bread", description: "It's bread")
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
  end


  it 'shows the chef name' do
    visit "/chefs/#{@chef_1.id}"
    
    expect(page).to have_content("Logan")
  end

  it 'has a link to the ingredients the chef uses' do
    visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content("Ingredients")
  end

  it 'clicks link' do
    visit "/chefs/#{@chef_1.id}"
    
    click_link "Ingredients"

    expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")
  end
end