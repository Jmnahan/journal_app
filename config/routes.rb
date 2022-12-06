Rails.application.routes.draw do
  root to: 'categories#index'
  devise_for :users

  resources :categories do
    resources :tasks
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
