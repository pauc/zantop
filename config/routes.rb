Zantop::Application.routes.draw do

  resources :sessions, only: [:index, :new, :create, :destroy]
  resources :users
  resources :pages, only: [:edit, :update]
  resources :posts

  match '/login',  to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'
  match '/about', to: 'dashboards#about'
  match '/contact', to: 'dashboards#contact'

  root to: 'dashboards#front'

  ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml', { prefix_on_default_locale: true })
end
