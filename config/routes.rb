Pamelabeckerphotography::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"
  
  resources :posts
	resources :sessions, only: [:create, :destroy]
  resources :messages
	resources :gallery_images
  resources :users do
  resources :photos
  end

  get "/home" => "static_pages#home"
	get "/gallery" => "static_pages#gallery"
  get "/packages" => "static_pages#packages"
  get "/dashboard" => "static_pages#dashboard"
  get "/login", to: "sessions#new", as:"new_user_session"
	get "/users/new", to: "users#new", as:"signup"
	get "/logout", to: "sessions#destroy", as:"destroy_session"
  root to: "static_pages#home"
end
