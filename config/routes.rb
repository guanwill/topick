Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  get '/photos' => 'photos#index'
  get '/photos/new' => 'photos#new'
  post '/photos' => 'photos#create'

end
