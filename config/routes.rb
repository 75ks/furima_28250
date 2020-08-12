Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :transactions, only: [:index, :create]
end
