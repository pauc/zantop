# frozen_string_literal: true

Rails.application.routes.draw do

  localized do
    post :session, to: "sessions#create"
    get  :login,   to: "sessions#new"
    get  :logout,  to: "sessions#destroy"

    resources :visual_works
    resources :action_works

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
