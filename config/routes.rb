Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :user
    resources :favorite
    resources :restaurant
    post '/home', to: 'home#index'
    post '/home/:id', to: 'home#search'
    post '/home/:id/reviews', to: 'home#reviews'
    post '/random', to: 'random#index'
    post '/login', to: 'auth#create'
    get '/profile', to: 'user#profile'

  end
end
