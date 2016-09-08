Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  resources :posts, only: [:index, :show]
  resources :categories, only: [:show]
  resources :tags, only: [:show], param: :slug

  namespace :admin do
    root 'application#index', as: :root
    resources :user, only: [:show, :new, :create]
    resources :posts, only: [:create, :update, :destroy]
  end
end
