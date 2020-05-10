Rails.application.routes.draw do
  root to: 'home#index'
  
  #user
  devise_for :users
  get 'users/:id/info', to: 'users#info', as: 'user_info'
  
  #product
  resources :products
  get 'product/:id/speak', to: 'products#speak', as: 'speak'
  get 'product/search', to: 'products#search', as: 'search'
  get '/myproducts', to: 'products#myproducts'
  get 'category', to: 'product_categories#category', defaults: { format: 'json' }
end
