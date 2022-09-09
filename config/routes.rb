# frozen_string_literal: true

Rails.application.routes.draw do
  resource :user, only: [:edit, :update]

  get "section_fields", to: "admin#section_fields"

  localized do
    get  :login,   to: "sessions#new"
    post :session, to: "sessions#create"
    get  :logout,  to: "sessions#destroy"

    resources :visual_works
    resources :action_works

    resources :works, only: [] do
      collection do
        get :admin
      end
    end

    # Tags
    resources :tags, except: [:new, :edit] do
      get "admin", on: :collection
    end

    get "contact", to: "contact_messages#new"
    resources :contact_messages, only: [:create]

    get "about", to: "dashboards#about"

    root to: "dashboards#front"
    get "more_works", to: "dashboards#more_works"
  end

  get "/", to: "dashboards#front"
end
