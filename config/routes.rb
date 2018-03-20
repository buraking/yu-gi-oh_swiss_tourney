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
  resources :registrations
  resources :rounds
  resources :sessions
  resources :sets
  resources :tournaments do
    resources :leaderboards
  end
  resources :users

  root to: 'root#show'
end
