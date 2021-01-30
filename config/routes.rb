Rails.application.routes.draw do
  root :to => 'pages#home'

  post '/' => 'destinations#search'

  get '/destinations/search/' => 'destinations#search'

  resources :reviews
  post '/reviews/:id/like' => 'reviews#like', :as => 'like_review'

  resources :users
  resources :destinations

  # For login / logout
  get '/auth/:provider/callback' => 'session#omniauth'
  get '/login' => 'session#new'         # login form
  get '/login/email' => 'session#email'
  post '/login' => 'session#create'     # process the login
  delete '/login' => 'session#destroy'  # logout
end
