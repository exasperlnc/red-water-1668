require 'rails_helper'

RSpec.describe "dish show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Logan")
    @ingredient_1 = Ingredient.create!(name: "bread", calories: 100)
    @dish_1 = @chef_1.dishes.create!(name: "Bread", description: "It's bread")
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    @ingredient_2 = Ingredient.create!(name: "more Bread", calories: 420)
  end
  it "show's dishes name, calories description" do
    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content("#{@dish_1.name}")
    expect(page).to have_content("#{@dish_1.description}")
    expect(page).to have_content("#{@dish_1.total_calories}")
  end

  it 'has list of ingredients' do
    visit "/dishes/#{@dish_1.id}"
    
    expect(page).to have_content("#{@ingredient_1.name}")
    expect(page).to_not have_content("#{@ingredient_2.name}")
  end

  it 'adds ingredients to dish' do
    visit "/dishes/#{@dish_1.id}"
    
    fill_in 'ingredient_id', with: "#{@ingredient_2.id}"
    click_button 'Add Ingredient' 
    save_and_open_page
    expect(page).to have_content("#{@ingredient_2.name}")
  end
end