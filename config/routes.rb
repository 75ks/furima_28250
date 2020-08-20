Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    member do
      resources :transactions, only: [:index, :create]
      resources :comments, only: [:create]
    end
  end
end
