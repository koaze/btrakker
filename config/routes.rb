Rails.application.routes.draw do
  
  devise_for :users
  resources :users do
      member do
          get :following, :followers
      end
  end
  resources :relationships, only: [:create, :destroy]
  resources :posts
  
  #Define Root URL
  root 'pages#index'
  
  #Define the routes for pages
  
  get '/home' => 'pages#home'
  get '/user/:id' => 'pages#profile'
  get '/posts/:id' => 'posts#destroy'
  get '/explore' => 'pages#explore'
  get '/about' => 'pages#about'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


