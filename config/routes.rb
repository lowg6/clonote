Rails.application.routes.draw do
  devise_for :users
  root 'notes#index'
  resources :notes
  get '/drafts', to: 'notes#index_draft'
  resources :users, param: :noteid, path: '/' do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
