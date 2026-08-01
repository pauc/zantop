# frozen_string_literal: true

Rails.application.routes.draw do
  # Health check for kamal-proxy. Deliberately outside `localized`: with
  # force_locale the block would only ever mount /ca/up, and the proxy asks
  # for /up.
  get "up", to: "rails/health#show", as: :rails_health_check

  localized do
    get  :login,   to: "sessions#new"
    post :session, to: "sessions#create"
    get  :logout,  to: "sessions#destroy"

    # Inside `localized` because every request goes through `set_locale`, which
    # bounces anything without a locale segment: unlocalized, /user/edit was
    # redirected to /ca/user/edit and there was no such route to land on.
    resource :user, only: [:edit, :update]

    resources :visual_works
    resources :action_works

    resources :works, only: [] do
      collection do
        get :admin
        patch :sort
      end
    end

    # Tags
    resources :tags, only: [:show, :update, :destroy] do
      get "admin", on: :collection
    end

    get "contact", to: "contact_messages#new"
    resources :contact_messages, only: [:create]

    get "about", to: "dashboards#about"

    resources :pages, only: [:edit, :update]

    root to: "dashboards#front"
    get "more_works", to: "dashboards#more_works"
  end

  get "/", to: "dashboards#front"
end
