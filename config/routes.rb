Rails.application.routes.draw do
  resources :near_by_places
  resources :comments
  resources :houses
  resources :places
  resources :locations
  resources :securities
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
