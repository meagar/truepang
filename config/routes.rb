Rails.application.routes.draw do

  get '/auth/500px/callback' => 'sessions#create'
  get '/login' => 'sessions#login', as: 'login'
  get '/logout' => 'sessions#logout', as: 'logout'
  get '/unauthorized' => 'sessions#unauthorized'


  resources :games

  resources :users

  root to: 'sessions#login'

end

