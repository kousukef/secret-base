Rails.application.routes.draw do
  root to: 'products#index'
  
  #user
  devise_for :users
  get 'users/info', to: 'users#info', as: 'user_info'
  
  #product
  resources :products
  get 'product/:id/speak', to: 'products#speak', as: 'speak'
  get 'product/:id/purchase', to: 'products#purchase', as: 'purchase'
  get 'product/search', to: 'products#search', as: 'search'
  get '/sales_products', to: 'products#sales_products'
  get '/purchased_products', to: 'products#purchased_products'
  get 'category', to: 'categories#category', defaults: { format: 'json' }
  
end
