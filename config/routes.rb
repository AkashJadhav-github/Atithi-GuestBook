Rails.application.routes.draw do

  root "receptionists#index"
  resources :guests #this will replace all the paths in routes file automatically (paths to 7 operations)
  resources :receptionists, only: [:index, :create]
  resources :sessions, only: [:create]
  get "log_out" => "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
