Rails.application.routes.draw do
  
  root to: 'tests#index'

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"

  resources :users, only: [:create, :show]
  # resources :sessions, only: :create

  resources :tests do
    member do
      post 'start'
    end

    resources :questions, shallow: true do
      resources :answers, shallow: true
    end

    resources :test_passages, shallow: true do
      member do
        get 'result'
      end
    end

  end
end
