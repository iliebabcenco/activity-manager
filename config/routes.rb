Rails.application.routes.draw do
 
  devise_for :users
  # resources :users, :only => [:show, :index]
  devise_scope :user do
    get "sign_up", to: "devise/registrations#new"
    get "login", to: "devise/sessions#new"
    get "users/sign_out", to: "devise/sessions#destroy"
    get "users", to: "users#index"
    get 'users/:id', to: "users#show", as: 'user'
 end
  root "activity#index"
end
