Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :products
  get 'product/:id/speak', to: 'products#speak', as: 'speak'
  resources :rooms, only: [:show, :create, :destroy]
  get '/myproducts', to: 'products#myproducts'
  get 'category', to: 'product_categories#category', defaults: { format: 'json' }
end
