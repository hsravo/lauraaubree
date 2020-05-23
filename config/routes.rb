Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/admin', to: 'home#admin'
  get '/dashboard', to: 'home#dashboard'

  scope 'administrator', module: 'admin', as: 'admin' do 
    resources :projects
    resources :publications
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
