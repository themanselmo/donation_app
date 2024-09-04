Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Misc endpoints
  root "sessions#new"

  get "signup", to: "users#new", as: "signup"
  get "signup", to: "users#create"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy", as: "logout"
  get "home", to: "fundraisers#index", as: "home"
  get "my_fundraisers", to: "fundraisers#my_fundraisers", as: "my_fundraisers"
  get "my_donations", to: "donations#my_donations", as: "my_donations"
  resources :users, only: [ :new, :create ]
  resources :fundraisers, only: [ :new, :create, :show ] do
    resources :donations, only: [ :create ]
  end
  resources :donations, only: [ :create ] do
    member do
      patch :toggle_pinned
    end
  end
end
