Rails.application.routes.draw do

  devise_for :users

  root 'home#index'

  resources :photos do
    member do
      put 'like', to: "photos#upvote"
      put 'dislike', to: "photos#downvote"
    end
  end

  get '/about' => 'about#index'

  # resources :conversations do
  #   resources :messages
  # end

  post 'photos/likes'
  delete 'photos/like_destroy'
  post 'photos/like_destroy'

end
