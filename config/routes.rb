Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :destroy] do
    member do
      get :followings
      get :followers
      get :likings
      get :likes
    end
    
=begin
    collection do
      get :search
    end
=end

  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  
  ############################################################
  #お気に入り用
=begin
  resources :users, only: [:create, :destroy] do
    member do
      get :likings
      get :likes
    end
  end

  resources :favorites, only: [:create, :destroy]
=end
  ############################################################
  
end