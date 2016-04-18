Rails.application.routes.draw do
  root "links#index"

  resources :users, only: [:new]

  get "/enter", to: "sessions#enter"
  get "/login", to: "sessions#new"

end
