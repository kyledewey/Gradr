Rails.application.routes.draw do
  root 'application#index'

  resources :users, :courses, :assignments, :memberships, :builds
  resource :sessions, only: [:new, :create, :destroy]

  # Match the GitHub route for now.
  get '/users/oauth_github/:step/:user_id', to: 'users#oauth_github_flow'
  post '/courses/new', to: 'courses#create'
  post '/assignments/new', to: 'assignments#create'
end
