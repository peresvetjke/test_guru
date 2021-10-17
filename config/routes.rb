Rails.application.routes.draw do
  
  root to: 'tests#index'

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end

    resources :gists, only: :index
  end
  
  resources :tests do
    member do
      post 'start'
    end

    resources :test_passages, shallow: true do
      member do
        get 'result'
        post 'create_gist'
      end
    end

  end

  resources :contact_messages, only: %i[new create]
end
