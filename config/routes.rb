Rails.application.routes.draw do
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :tournaments
    resources :rounds
    resources :users
  end

  resources :tournaments
  resources :users
  resources :signups
  resources :participants
  resources :rounds
  resources :decks
<<<<<<< Updated upstream
  resources :matches
=======
>>>>>>> Stashed changes

  root to: 'sessions#new'
end
