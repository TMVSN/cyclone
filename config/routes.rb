Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:new, :index, :show, :destroy]
  resources :orders, ony: [:new, :create, :index]
  post 'users/add_user', to: 'users#add_user'
end
