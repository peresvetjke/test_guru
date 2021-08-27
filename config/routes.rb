Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/about', to: 'static_pages#about'
  get '/about/author', to: 'static_pages#about_author'
end
