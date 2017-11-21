Rails.application.routes.draw do


  resources :decks, only: [:index, :show] do
    resources :rounds, only: [:new, :create, :show]
  end

  resources :rounds, only: [:show] do
    resources :cards, only: [:show] do
      resources :guesses, only: [:create]
    end

  end

  resources :cards, only: [:show] do
    resources :guesses, only: [:new, :create]
  end
  root "decks#index"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'



  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  post '/rounds/:round_id/cards/:card_id/guesses', to:'rounds#new_guess', as: "new_guess"


end
