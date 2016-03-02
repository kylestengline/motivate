Rails.application.routes.draw do

  get 'sessions/new'

	root 'welcome#index'
  
	get '/administrators/login_form' => 'administrators#login_form'
	post '/administrators/login' => 'administrators#login'

	# get '/users/login_form' => 'users#login_form'
	# post 'users/login' => 'users#login'

  get 'logout' => 'sessions#destroy'
  post'logout' => 'sessions#destroy'
  delete 'logout' => 'sessions#destroy'

  resources :comments
  resources :posts
  resources :users
  resources :administrators
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
