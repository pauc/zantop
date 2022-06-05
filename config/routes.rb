# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]

  localized do
    get :login, to: "sessions#new"
    get :logout, to: "sessions#destroy"

    resources :visual_works
    resources :action_works

    # Works
    resources :works, only: [] do
      get 'admin', on: :collection
      post :sort, on: :collection
    end

    # Tags
    resources :tags, except: [:new, :edit] do
      get "admin", on: :collection
    end

    get "contact", to: "contact_messages#new"
    resources :contact_messages, only: [:create]

    get "about", to: "dashboards#about"

    root to: "dashboards#front"
  end

  get "/", to: "dashboards#front"
end
