Rails.application.routes.draw do

  get '/', to: 'users#welcome', as: 'root'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: "logout"
  post '/users/:id', to: 'users#show'
  post '/rides/:id', to: 'rides#new'

  resources :users, :sessions, :attractions, :rides


end
