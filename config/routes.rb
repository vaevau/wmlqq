Rails.application.routes.draw do
	root 'home#index'
	
  get    '/login',  to: 'sessions#new'
  post 	 '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get    '/search', to: 'users#search'

  get '/signup', to: 'users#new'
  resources :users, only: [:create]
  resources :home, 	only: [:index]
  resources :friendships, only: [:new, :create]
  resources :messages, only: [:index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server, at: '/cable'
end
