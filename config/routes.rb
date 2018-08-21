Rails.application.routes.draw do

  resources :items do
    resources :reviews
end
  resources :bookings
  devise_for :users
  devise_for :models
  resources :users

  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
