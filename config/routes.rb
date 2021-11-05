Rails.application.routes.draw do
  resources :action_works
  resources :visual_works

  get 'contact', to: 'contact_messages#new'
  post 'contact_messages/create'

  get 'home', to: 'dashboards#home'
  get 'about', to: 'dashboards#about'

  root to: 'dashboards#home'
end
