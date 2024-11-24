Rails.application.routes.draw do
  resources :users, only: [:index, :create]
  resources :products
  resources :orders, only: [:index, :show, :create]
end
