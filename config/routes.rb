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

  # Defines the root path route ("/")
  # root "posts#index"
end
