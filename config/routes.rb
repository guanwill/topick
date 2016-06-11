Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  resources :photos

  # resources :conversations do
  #   resources :messages
  # end

  post 'photos/likes'
  delete 'photos/likes'

end
