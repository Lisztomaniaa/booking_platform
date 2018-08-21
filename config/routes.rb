Rails.application.routes.draw do

  resources :items do
    collection do
      get :owned
    end
    resources :reviews, except: :create
end
  resources :bookings
  devise_for :users
  resources :users, only: :show


  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :reviews, only: :create
end
