Rails.application.routes.draw do
  root to: 'products#index'
  
  #user
  devise_for :users
  get 'users/info', to: 'users#info', as: 'user_info'
  get '/users', to: 'users#redirect_to_new_user_registration_path'
  
  #product
  resources :products
  get 'product/:id/purchase', to: 'products#purchase', as: 'purchase'
  get '/sales_products', to: 'products#sales_products'
  get '/purchased_products', to: 'products#purchased_products'
  get 'category', to: 'categories#category', defaults: { format: 'json' }

  #search
  get 'search', to: 'search#search', as: 'search'

  #speak
  get 'product/:id/speak', to: 'speaks#speak', as: 'speak'
end
