Rails.application.routes.draw do
  resources :recipes do
    resources :ingredients, only: [:show, :index, :new, :create]
  end
  resources :grocery_list_items
  resources :grocery_lists
  resources :ingredients
  resources :recipe_ingredients
  
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  delete "/logout", to: "sessions#logout", as: "logout"
  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create"
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  root "sessions#login"
end
