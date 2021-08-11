Rails.application.routes.draw do
  resources :recipes
  resources :grocery_list_items
  resources :grocery_lists
  resources :ingridents
  resources :recipe_ingridents
  
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  delete "/logout", to: "sessions#logout", as: "logout"
  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create"
  get "/auth/:provider/callback", to: 'sessions#omniauth'
end
