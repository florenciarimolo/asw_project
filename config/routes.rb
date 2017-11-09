Rails.application.routes.draw do
  resources :issues
  resources :users
  get '/auth/twitter/callback', to: 'sessions#create'
  root 'pages#index'
end
