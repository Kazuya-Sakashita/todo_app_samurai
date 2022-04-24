Rails.application.routes.draw do
  resources :todos
  resources :goals
  root to: "home#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
