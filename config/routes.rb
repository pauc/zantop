Rails.application.routes.draw do
  get 'contact', to:'contact_messages#new'
  post 'contact_messages/create'

  get 'dashboards/home', as: 'home'

  root to: 'dashboards#home'
end
