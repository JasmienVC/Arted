Rails.application.routes.draw do
  root to: "pages#home"

  resources :profiles
  resources :artworks do
    resources :transactions
  end


  # get 'transactions/index'
  # get 'transactions/show'
  # get 'profiles/show'
  # get 'profiles/edit'
  # get 'profiles/update'
  # get 'profiles/destroy'
  # get 'artworks/show'
  # get 'artworks/create'
  # get 'artworks/new'
  # get 'artworks/index'
  # get 'artworks/edit'
  # get 'artworks/update'
  # get 'artworks/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
