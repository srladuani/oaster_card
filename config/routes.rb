Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :journeys
  resources :cards

  root to: 'visitors#index'
end
