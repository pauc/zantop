Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]
  get :login, to: "sessions#new"
  get :logout, to: "sessions#destroy"

  localized do
    resources :visual_works
    resources :action_works

    get 'contact', to: 'contact_messages#new'
    resources :contact_messages, only: [:create]

    get 'home', to: 'dashboards#home'
    get 'about', to: 'dashboards#about'

    root to: 'dashboards#home'
  end
end
