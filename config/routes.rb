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
  	resources :maps, only: [:show]
  	get '/map_request', to: 'maps#map', as: 'map_request'
  end

  resources :users, only:[:show, :edit, :update] do
    collection do
      get :likes
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
