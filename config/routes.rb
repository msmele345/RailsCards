Rails.application.routes.draw do


  resources :decks


  root "decks#index"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'



  get '/signup' => 'users#new'
  post '/users' => 'users#create'


end
