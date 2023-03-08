Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :doctor
  resources :patient
  resources :department
  resources :schedule
  resources :appointment
  resources :medical_history
  post "/login", to: "users#login"
  resources :posts

end
