Rails.application.routes.draw do
  get 'artworks/show'
  get 'artworks/create'
  get 'artworks/new'
  get 'artworks/index'
  get 'artworks/edit'
  get 'artworks/update'
  get 'artworks/destroy'
  root to: "pages#home"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
