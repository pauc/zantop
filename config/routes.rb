Rails.application.routes.draw do
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
