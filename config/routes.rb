Rails.application.routes.draw do
  devise_for :users
  resources :welcomes

  resources :categories, only: [:index, :new, :create, :edit, :update] do
    resources :expense_categories, only: [:index]
  end

  resources :expenses, only: [:new, :create, :show, :destroy] do
    resources :expense, only: [:new, :edit, :update]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcomes#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end 
end
