Rails.application.routes.draw do

  resources :events
  root to: 'pages#home'
  get 'pages/home'
  get 'pages/about'
  get 'pages/myevents'
  post 'pages/joinevent'
  devise_for :users
  mount ActionCable.server => '/cable'
end
