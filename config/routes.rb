Rails.application.routes.draw do
  root to: "tasks#index"
  resources :tasks

  get "login", to: "sessions#new"
end
