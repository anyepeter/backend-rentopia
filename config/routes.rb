Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  resources :near_by_places
  resources :comments
  resources :houses
  resources :places
  resources :locations
  resources :securities
  resources :categories
  resources :users
  post 'login', to: 'authenticate#login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
