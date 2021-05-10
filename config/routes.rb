Rails.application.routes.draw do
 
  devise_for :users
  # resources :users, :only => [:show, :index]
  devise_scope :user do
    get "users/sign_up", to: "devise/registrations#new"
    get "users/sign_in", to: "devise/sessions#new"
    get "users/sign_out", to: "devise/sessions#destroy"
    get "users", to: "users#index"
    get 'users/:id', to: "users#show", as: 'user'
  end
  root "activities#index"
  
  resources :activities, only: [:index, :show, :new, :create]
  post "activities/new", to: "activities#create"


end
