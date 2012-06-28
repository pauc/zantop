Zantop::Application.routes.draw do

  resources :sessions, only: [:index, :new, :create, :destroy]
  resources :users
  resources :pages, only: [:index, :show, :edit, :update]

  match '/login',  to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'
  match '/about', to: 'dashboards#about'
  match '/contact', to: 'dashboards#contact'

  root to: 'dashboards#front'
end
