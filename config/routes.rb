Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/admin', to: 'home#admin'
  get '/dashboard', to: 'home#dashboard'
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'



  scope module: 'admin' do #under admin scope without admin prefix
    resources :projects
      get '/projects/:slug', to: 'projects#show'
    resources :publications
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
