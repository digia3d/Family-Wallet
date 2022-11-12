Rails.application.routes.draw do
  resources :expense_categories
  resources :welcomes
  resources :categories
  resources :expenses
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcomes#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end 
end
