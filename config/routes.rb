Rails.application.routes.draw do
  root to: 'categories#index'
  devise_for :users
  # get '/user' => 'categories#index', :as => :user_root

  # devise_scope :user do
  #   get 'users/sign_out' => 'devise/sessions#destroy'
  # end

  resources :categories do
    resources :tasks
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
