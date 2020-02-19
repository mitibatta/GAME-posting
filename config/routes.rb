Rails.application.routes.draw do

  namespace :api, {format: 'json'} do
    resources :favorites, only: [:index, :create, :destroy]
  end
  
  
  get '/comments', to: 'comments#new'
  post '/comments', to: 'comments#create'
  get 'sessions/new'
  root 'pages#home'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

  resources :users
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
