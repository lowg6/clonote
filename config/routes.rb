Rails.application.routes.draw do
  devise_for :users
  root 'notes#index'

  get '/drafts', to: 'notes#index_draft'

  resources :notes
  resources :comments, only: :create
  resources :favorites, only: [:create, :destroy]
  resources :users, param: :noteid, path: '/' do
    member do
     get :following, :followers, :favorite
    end
  end
  resources :relationships, only: [:create, :destroy]
end
