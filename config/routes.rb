Rails.application.routes.draw do
  devise_for :users
  root to: 'toppages#index'
  
  get 'rankings/favorite', to: 'rankings#favorite' 
  
  resources :games, only: [:new]
  resources :posts, only: [:new, :create, :destroy, :edit, :update] 
  # do
    # member do
    #   get :favoriteusers
    # end
  # end
  
  resources :users, only: [:show] do
    member do
      get :likes
    end
  end
  
  resources :favorites, only: [:create, :destroy]
end
