Rails.application.routes.draw do

  devise_for :users

  resources :experiences
  resources :skills
  resources :requests do
    resources :offers, only: [:create, :destroy]
  end

  # resources :sessions, only: [:new, :create, :destroy]

  # get '/login', to: 'sessions#new', as: 'login'
  # delete '/logout', to: 'sessions#destroy', as: 'logout'
  #
  # get 'myprofile', to: 'profile#show', as: :show_profile
  # get 'profile', to: 'profile#edit', as: :edit_profile
  # patch 'profile', to: 'profile#update'

  get '/requests', to: "requests#index"
  get '/skills', to: "skills#index"

  get 'home/index'
  # get 'sign_up', to: 'registration#new'
  # post 'sign_up', to: 'registration#create'

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
