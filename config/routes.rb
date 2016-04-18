Rails.application.routes.draw do
  root "links#index"

  resources :users, only: [:new, :create]
  resources :links, only: [:index, :create, :update]

  get "/enter", to: "sessions#enter"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
