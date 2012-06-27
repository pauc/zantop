Zantop::Application.routes.draw do

  resources :sessions, only: [:index, :new, :create, :destroy]
  resources :users

  match '/login',  to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'

  root to: 'users#index'
end
