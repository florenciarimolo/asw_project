Rails.application.routes.draw do
 # get 'uploads/index'

 # get 'uploads/new'

 # get 'uploads/create'

 # get 'uploads/destroy'

  resources :uploads, only: [:index, :new, :create, :destroy]
  resources :issue_lists
  resources :comments
  resources :issues
  resources :users
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'pages#index'
end
