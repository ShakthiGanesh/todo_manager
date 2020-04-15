Rails.application.routes.draw do
  resources :todos
  resources :users
  post "users/login", to: "users#login"

  root to: "home#index"
  get "/signin", to: "sessions#new", as: :new_session
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
