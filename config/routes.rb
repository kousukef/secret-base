Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :products
  resources :rooms, only: [:show, :create, :destroy]
  get '/myproducts', to: 'products#myproducts'
  mount ActionCable.server => '/cable'
end
