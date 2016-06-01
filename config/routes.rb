Rails.application.routes.draw do

  # get 'homes/index'

  get "log_in" => "sessions#new", :as => "log_in"

  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "homes#index"
  resources :users
  resources :sessions
  resources :people do
    resources :hobbies
  end
  resources :addresses

end
