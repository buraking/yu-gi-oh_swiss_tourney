Rails.application.routes.draw do
  namespace :api do
    resources :rounds
    resources :tournaments
    resources :users
  end

  resources :deck_cards
  resources :decks
  resources :matches
  resources :participants
  resources :rounds
  resources :sessions
  resources :sets
  resources :signups
  resources :tournaments do
    resources :leaderboards
  end
  resources :users

  root to: 'tournaments#index'
end
