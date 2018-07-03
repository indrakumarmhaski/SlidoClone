Rails.application.routes.draw do

  resources :events
  root to: 'pages#home'
  get 'pages/home'
  get 'pages/about'
  get 'pages/myevents'
  post 'pages/joinevent'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
