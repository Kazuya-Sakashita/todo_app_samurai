Rails.application.routes.draw do
  # resources :todos
  # resources :goals
  root to: "home#index"
  devise_for :users

  resources :goals do
    resources :todos do
        member do
        # /goals/:goal_id/todos/:id/sort というURLに対して
        # todos#sort というアクションを割り当てる
        get "sort"
        end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
