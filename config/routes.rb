Rails.application.routes.draw do

	root 'welcome#index'

  get 'rooms/show'

  get 'sessions/new'
  
	get '/administrators/login_form' => 'administrators#login_form'
	post '/administrators/login' => 'administrators#login'

	get '/users/login_form' => 'users#login_form'
	post 'users/login' => 'users#login'
  
  get 'logout' => 'sessions#destroy'
  post'logout' => 'sessions#destroy'
  delete 'logout' => 'sessions#destroy'

  post '/posts/vote' => 'posts#vote'

  resources :posts, only: [:index, :show]# do
#    resources :comments
#  end

  namespace :admin do
    resources :posts
  end

  resources 'contacts', only: [:new, :create] 

  #resources :users
  resources :administrators
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'rooms/show' => 'messages#show'
  post 'rooms/show' => 'messages#show'
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
