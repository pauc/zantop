Rails.application.routes.draw do
  get 'dashboards/home', as: 'home'

  root to: 'dashboards#home'
end
