Pamelabeckerphotography::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"
  
  resources :gallery_images
  resources :posts
	resources :sessions, only: [:create, :destroy]
  resources :messages
  resources :users do
  resources :images
  end

  get "/home" => "static_pages#home"
  get "/gallery" => "gallery_images#index"
  get "/packages" => "static_pages#packages"
  get "/dashboard" => "static_pages#dashboard"
  get "/login", to: "sessions#new", as:"new_user_session"
	get "/users/new", to: "users#new", as:"signup"
	get "/logout", to: "sessions#destroy", as:"destroy_session"
  root to: "static_pages#home"
end
