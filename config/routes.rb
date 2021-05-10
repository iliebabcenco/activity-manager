Rails.application.routes.draw do
 
  devise_for :users
  # resources :users, :only => [:show, :index]
  devise_scope :user do
    get "users/sign_up", to: "devise/registrations#new"
    get "users/sign_in", to: "devise/sessions#new"
    get "users/sign_out", to: "devise/sessions#destroy"
    get "users", to: "users#index"
    get 'users/:id', to: "users#show", as: 'user'
    get "personal-activities", to: "users#personal_activities"
    get "external-activities", to: "users#external_activities"
  end
  root "activities#index"
 
  resources :activities, only: [:index, :show, :new, :create]
  get "activities/new-personal", to: "activities#new_personal"
  get "activities/new-external", to: "activities#new_external"
  post "activities/new_personal", to: "activities#create_personal"
  post "activities/new-external", to: "activities#create_external"
  resources :groups, only: [:index, :show, :new, :create]


end
