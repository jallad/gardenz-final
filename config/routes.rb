Rails.application.routes.draw do

  resources :skills
  resources :requests
  resources :sessions, only: [:new, :create, :destroy]

  get '/login', to: 'sessions#new', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/requests', to: "requests#index"
  get '/skills', to: "skills#index"

  get 'home/index'
  get 'sign_up', to: 'registration#new'
  post 'sign_up', to: 'registration#create'

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
