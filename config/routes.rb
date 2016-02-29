Rails.application.routes.draw do

	root 'welcome#index'
  
	get '/administrators/login' => 'administrators#login'
	post '/administrators/login' => 'administrators#login'

	get '/users/login' => 'users#login'
	post '/users/login' => 'users#login'


  resources :comments
  resources :posts
  resources :users
  resources :administrators
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
