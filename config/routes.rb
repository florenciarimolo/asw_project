Rails.application.routes.draw do
 # get 'uploads/index'

 # get 'uploads/new'

 # get 'uploads/create'

 # get 'uploads/destroy'

  get 'issues_watches/new'

  get 'issues_watches/create'

  get 'issues_watches/destroy'

  get 'issues_votes/new'

  get 'issues_votes/create'

  get 'issues_votes/destroy'

  resources :uploads, only: [:index, :new, :create, :destroy]
  resources :issue_lists
  resources :comments
  resources :issues
  resources :users
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'pages#index'
end
