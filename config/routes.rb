Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :update, :destroy]
      resources :problems, only: [:index, :create, :show, :update, :destroy]
      resources :proposals, only: [:index, :create, :show, :update, :destroy]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      #get '/problems/:id/proposals', to: 'proposals#index'


    end
  end
end
