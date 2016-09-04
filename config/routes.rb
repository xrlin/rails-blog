Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#index'
  namespace :admin do
    root 'application#index', as: :root
    resources :user, only: [:show, :new, :create]
  end
end
