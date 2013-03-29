Zantop::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  # Users
  resources :users, except: [:index, :show, :destroy]

  # Provisional. Only for testing purposes
  resources :posts do
    post :sort, on: :collection
  end

  # Works
  resources :works, only: [] do
    get 'admin', on: :collection
    post :sort, on: :collection
  end

  resources :action_works

  resources :visual_works

  # Sessions
  resources :sessions, only: [:create, :destroy]
  match '/login',  to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'

  # Pages
  resources :pages, only: [:edit, :update]
  match '/about', to: 'dashboards#about'

  # Canvi de pàgina d'inici provisional:
  match '/front', to: 'dashboards#front'
  root to: 'dashboards#provisional'

  # Tags
  resources :tags, except: [:new, :edit] do
    get 'admin', on: :collection
  end

  match '/contact', to: 'contact_messages#new'
  resources :contact_messages, only: [:create]

  ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml', { prefix_on_default_locale: true })
end
