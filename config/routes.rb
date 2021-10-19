Rails.application.routes.draw do
  get 'dashboards/front', as: 'front'

  root to: 'dashboards#front'
end
