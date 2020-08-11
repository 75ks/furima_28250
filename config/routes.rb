Rails.application.routes.draw do
  devise_for :users
  
  resources :items, only: [:new, :create, :show]
end
