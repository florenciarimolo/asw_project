Rails.application.routes.draw do
  resources :comments
  resources :issues
  resources :users
  root 'issues#index'
end
