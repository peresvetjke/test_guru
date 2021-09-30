Rails.application.routes.draw do
  
  root to: 'tests#index'

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end

  resources :tests do
    member do
      post 'start'
    end

    resources :test_passages, shallow: true do
      member do
        get 'result'
      end
    end

  end
end
