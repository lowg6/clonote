Rails.application.routes.draw do
  devise_for :users
  root 'notes#index'
  resources :notes
  resources :users, only: :show do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
