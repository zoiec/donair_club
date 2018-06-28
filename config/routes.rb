Rails.application.routes.draw do
  root to: 'reviews#index'
  
  resources :restaurants
  resources :reviews
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  mount ActionCable.server => '/cable'
end
