Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    member do
      patch :become_seller
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :products do
    resources :orders, only: [:create]
  end
  
  root to: "products#index"
end
