Rails.application.routes.draw do
  root 'application#index'
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/manifest.json', to: 'application#manifest'

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  get '/auth/:provider/callback', to: 'sessions#create'
get '/auth/failure', to: 'sessions#failure'
get '/login', to: redirect('/auth/github')
get '/auth/github/callback' => "sessions#create"

resources :sessions, only: [:new, :create, :destroy]
get 'login', to: 'sessions#new'
delete 'logout', to: 'sessions#destroy'
end

