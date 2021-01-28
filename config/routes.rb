Rails.application.routes.draw do
  root :to => 'pages#home'

  post '/' => 'destinations#search'

  get '/destinations/search/' => 'destinations#search'

  resources :reviews
  post '/reviews/:id/like' => 'reviews#like', :as => 'like_review'

  resources :users
  resources :destinations



  # For login / logout
  get '/login' => 'session#new'         # login form
  post '/login' => 'session#create'     # process the login
  delete '/login' => 'session#destroy'  # logout
end
