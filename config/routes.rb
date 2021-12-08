Rails.application.routes.draw do
  localized do
    resources :visual_works
    resources :action_works

    get 'contact', to: 'contact_messages#new'
    post 'contact_messages/create'

    get 'home', to: 'dashboards#home'
    get 'about', to: 'dashboards#about'

    root to: 'dashboards#home'
  end
end
