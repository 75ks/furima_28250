Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'items#index'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    member do
      resources :transactions, only: [:index, :create]
      resources :comments, only: [:create]
    end
    collection do
      get 'search'
    end
  end
end
