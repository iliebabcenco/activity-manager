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
  root "application#show"
  get "feed", to: "application#index"
 
  resources :activities, only: [:index, :new, :create_personal]
  get "activities/new-personal", to: "activities#new"
  get "activities/new-external", to: "activities#new_external"
  post "activities/new-personal", to: "activities#create_personal"
  post "activities/new-external", to: "activities#create_external"
  resources :groups, only: [:index, :show, :new, :create]
  resources :activity_participations, only: [:index, :show, :new, :create]

end
