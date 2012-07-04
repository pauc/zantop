Zantop::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  resources :sessions, only: [:index, :new, :create, :destroy]
  resources :users
  resources :pages, only: [:edit, :update]
  resources :posts do
    post :sort, on: :collection
  end
  resources :action_works do
    post :sort, on: :collection
    post :sort_nested, on: :member
  end
  resources :visual_works do
    post :sort, on: :collection
    post :sort_nested, on: :member
  end

  match '/login',  to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'
  match '/about', to: 'dashboards#about'
  match '/contact', to: 'dashboards#contact'

  root to: 'dashboards#front'

  ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml', { prefix_on_default_locale: true })
end
