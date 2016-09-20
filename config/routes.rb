Rails.application.routes.draw do
  get 'friendships/new'

  get 'friendships/create'

	root 'home#index'
	
  get    '/login',  to: 'sessions#new'
  post 	 '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  resources :users, only: [:create]
  resources :home, 	only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
