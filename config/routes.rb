Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    member do
      resources :transactions, only: [:index, :create]
    end
  end
end
