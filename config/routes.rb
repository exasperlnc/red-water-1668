Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dishes/:id', to: 'dish#show', as: 'dish'
  post '/dish_ingredient', to: 'dish_ingredient#create'
  get '/chefs/:id', to: 'chef#show'
  get '/chefs/:id/ingredients', to: 'chef_ingredients#index', as: "chef_ingredients"
end
