# frozen_string_literal: true

Rails.application.routes.draw do
  localized do
    # Sessions
    resource :session, only: [:create, :destroy]
    get :login, to: "sessions#new"
    get :logout, to: "sessions#destroy"

    # Users
    resources :users, except: [:index, :show, :destroy]

    # Works
    resources :visual_works
    resources :action_works

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
