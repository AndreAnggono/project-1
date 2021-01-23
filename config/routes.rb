Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :reviews
  resources :users, :only => [:new, :create]
  resources :destinations

  # For login / logout
  get '/login' => 'session#new'         # login form
  post '/login' => 'session#create'     # process the login
  delete '/login' => 'session#destroy'  # logout

end
