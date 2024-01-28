Rails.application.routes.draw do
  root "books#index"

  get 'main/index'

  resources :books do
    member do
      get :delete
    end
  end

  # get 'books/index'
  # get 'books/new'
  # get 'books/edit'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
