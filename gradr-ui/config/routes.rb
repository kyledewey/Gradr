Rails.application.routes.draw do
  root 'application#index'

  resources :users, :courses, :assignments
  resource :sessions, only: [:new, :create, :destroy]

  # Match the GitHub route for now.
  get '/users/oauth_github/:step/:user_id', to: 'users#oauth_github_flow'
end
