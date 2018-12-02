Rails.application.routes.draw do
  devise_for :users
  root to: 'toppages#index'
  
  
  resources :games, only: [:new]
  resources :posts, only: [:new, :create, :destroy, :edit, :update]
end
