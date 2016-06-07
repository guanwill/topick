Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  # get '/photos/new' => 'photos#new'
  # post '/photos' => 'photos#create'
  # get '/photos/edit' => 'photos#edit'
  # delete '/photos/delete' => 'photos#destroy'

  resources :photos 

  resources :conversations do
    resources :messages
  end

end
