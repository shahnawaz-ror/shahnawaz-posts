Rails.application.routes.draw do
  resources :tags
  resources :posts do
    resources :comments
  end
  get 'home/index'
  # devise_for :users
  root 'home#index'

  resources :cities, only: :index
  resources :states, only: :index
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }

end
