Rails.application.routes.draw do
  resources :magazines
  devise_for :users
  root 'notes#index'

  get '/drafts', to: 'notes#index_draft'
  get '/hashtag/:id', to: 'notes#index_hashtag'

  resources :notes
  resources :comments, only: :create
  resources :purchases, only: [:index, :new, :create]
  resources :users, param: :noteid, path: '/' do
    member do
     get :following, :followers, :favorite
    end
  end
  resources :favorites, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :magazine_relationships, only: [:create, :destroy]
end
