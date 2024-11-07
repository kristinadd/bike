require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Sidekiq UI
  mount Sidekiq::Web => '/sidekiq'


  # Defines the root path route ("/")
  root "home#index"

  get "rides/index" => "rides#index", as: :all_rides
  get "rides/new" => "rides#new", as: :new_ride
  post "rides/create" => "rides#create", as: :create_ride
  get "rides/edit/:id" => "rides#edit", as: :edit_ride
  patch "rides/update/:id" => "rides#update", as: :update_ride
  get "rides/destroy/:id" => "rides#destroy", as: :destroy_ride

  get "cities/index" => "cities#index", as: :all_cities
  get "cities/new" => "cities#new", as: :new_city
  post "cities/create" => "cities#create", as: :create_city
  get "cities/edit/:id" => "cities#edit", as: :edit_city
  patch "cities/update/:id" => "cities#update", as: :update_city
  get "cities/destroy/:id" => "cities#destroy", as: :destroy_city

  get "users/index" => "users#index", as: :all_users
  get "users/new" => "users#new", as: :new_user
  post "users/create" => "users#create", as: :create_user
  get "users/destroy/:id" => "users#destroy", as: :destroy_user

  get "sessions/new" => "sessions#new", as: :new_session
  post "sessions/create" => "sessions#create", as: :create_session
  get "sessions/destroy/" => "sessions#destroy", as: :destroy_session

  # ❤️
  post "reactions/create" => "reactions#create", as: :create_reaction
end
