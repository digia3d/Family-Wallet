Rails.application.routes.draw do
  resources :expense_categories
  resources :welcomes
  resources :categories
  resources :expenses
  get 'users/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
