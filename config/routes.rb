Rails.application.routes.draw do
  resources :issues
  resources :users
  get '/auth/twitter/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'pages#index'
end
