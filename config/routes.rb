Rails.application.routes.draw do
  resources :issues
  resources :users
  root 'pages#index'
end
