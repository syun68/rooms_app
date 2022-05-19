Rails.application.routes.draw do
  get 'reservations/new'
  get '/' => 'rooms#top'
  get '/users/login_form'      => 'users#login_form'
  post '/login'                => 'users#login'
  delete '/logout'             => 'users#logout'
  delete '/'                   => 'rooms#top'
  get '/users/profile'         => 'users#profile'
  get '/users/account'         => 'users#account'
  get '/users/edit'            => 'users#edit'
  post '/users/account_update' => 'users#account_update'
  get '/rooms/new'             => 'rooms#new'
  get '/rooms/posts'           => 'rooms#posts'
  get '/rooms/search'          => 'rooms#search'
  get '/rooms/:id'             => 'rooms#show'
  get '/reservations'          => 'reservations#reservations'
  get '/reservations/new'      => 'reservations#new'
  get '/reservations/:id'      => 'reservations#show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :rooms
  resources :reservations
end
