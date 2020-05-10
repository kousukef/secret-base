Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  get 'users/:id/info', to: 'users#info', as: 'user_info'
  resources :products
  get 'product/:id/speak', to: 'products#speak', as: 'speak'
  get 'product/search', to: 'products#search', as: 'search'
  resources :rooms, only: [:show, :create, :destroy]
  get '/myproducts', to: 'products#myproducts'
  get 'category', to: 'product_categories#category', defaults: { format: 'json' }
end
