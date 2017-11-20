Rails.application.routes.draw do


  resources :decks, only: [:index, :show] do
    resources :rounds, only: [:new, :create, :show]
  end


  root "decks#index"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'



  get '/signup' => 'users#new'
  post '/users' => 'users#create'


end
