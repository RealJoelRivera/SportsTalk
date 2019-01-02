Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts
  resources :sports
  resources :sessions, only: [:index, :new, :create]

  root "users#new", as: "home"

  post "/logout", to: "sessions#destroy", as: "logout"
end
