Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sessions#new'
  
  resources :users
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
