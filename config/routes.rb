Rails.application.routes.draw do
  resources :projects
  resources :publications
  devise_for :users
  root to: 'home#index'
  get '/admin', to: 'home#admin'
  get '/dashboard', to: 'home#dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
