Rails.application.routes.draw do
  root to: "tasks#index"
  resources :tasks, only: %i[index new create edit update]
end
