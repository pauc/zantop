# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]

  localized do
    get :login, to: "sessions#new"
    get :logout, to: "sessions#destroy"

    resources :visual_works
    resources :action_works

    get "contact", to: "contact_messages#new"
    resources :contact_messages, only: [:create]

    get "about", to: "dashboards#about"

    root to: "dashboards#front"
  end

  get "/", to: "dashboards#front"
end
