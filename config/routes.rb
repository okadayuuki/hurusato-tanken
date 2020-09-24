Rails.application.routes.draw do


    devise_for :users

  get '/' => 'home#top', as:'top_path'
  get 'home/about'

  resources :posts
  resources :users, only:[:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
