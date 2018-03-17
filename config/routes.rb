Rails.application.routes.draw do
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :tournaments
    resources :users
  end

  resources :tournaments
  resources :users
end
