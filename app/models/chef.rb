class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def ingredient_names
    ingredients.distinct.pluck(:name)
  end
end