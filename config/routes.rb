Rails.application.routes.draw do



  devise_for :users

  get '/' => 'home#top', as:'top_path'
  get 'home/about'

  resources :posts do
  	resources :comments, only: [:create, :destroy]
  	resource :like, only: [:create, :destroy]
  	collection do
  		get :search
  	end
  end
   resources :maps, only: [:index]
     get '/map_request', to: 'maps#map', as: 'map_request'

  resources :users, only:[:show, :edit, :update]
  get 'users/:id/likes' => 'users#likes', as:'likes_path'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
