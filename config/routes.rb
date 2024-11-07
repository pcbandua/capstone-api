Rails.application.routes.draw do
  resources :employers
  resources :apprentices
  resources :apprenticeships
  resources :applications
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Applications Routes
  get "/applications" => "applications#index"
  post "/applications" => "applications#create"
  get "applications/:id" => "applications#show"

  # Apprenticeship Routes
  get "/apprenticeships" => "apprenticeships#index"
  post "/apprenticeships" => "apprenticeships#create"
  get "apprenticeships/:id" => "apprenticeships#show"
  get "apprenticeships/new" => "apprenticeships#new"
  delete "apprenticeships/:id" => "apprenticeships#destroy"

  # Apprentice Routes
  get "/apprentice" => "apprentice#index"
  post "/apprentice" => "apprentice#create"
  get "apprentice/:id" => "apprentice#show"
  get "apprentice/new" => "apprentice#new"
  delete "apprentice/:id" => "apprentice#destroy"

  # Employer Routes
  get "/employer" => "employer#index"
  post "/employer" => "employer#create"
  get "employer/:id" => "employer#show"
  get "employer/new" => "employer#new"
  delete "employer/:id" => "employer#destroy"

  # Authentication
  post "/sessions" => "sessions#create"
  # Defines the root path route ("/")
  # root "posts#index"
end
