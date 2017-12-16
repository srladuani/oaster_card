Rails.application.routes.draw do
  resources :journeys
  resources :cards
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
