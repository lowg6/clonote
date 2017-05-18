Rails.application.routes.draw do
  devise_for :users
  root 'notes#index'

  get '/drafts', to: 'notes#index_draft'
  get '/recommend', to: 'notes#index_recommend'
  get '/hashtag/:id', to: 'notes#index_hashtag'
  get '/category/:id', to: 'notes#index_category'

  resources :notes do
    collection do
      get :set_search_result_users_hashtags
    end
  end
  resources :magazines
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
