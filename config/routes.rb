Rails.application.routes.draw do
  resources :issue_lists
  resources :comments
  resources :issues
  resources :users
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'pages#index'
end
