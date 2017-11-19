Rails.application.routes.draw do
  get 'comments?issue_id=:issue_id' => 'comments#index'
  get 'comments/:id?issue_id=:issue_id' => 'comments#show'
  get 'comments/new?issue_id=:issue_id' => 'comments#new' 
  get 'comments/:id/edit?issue_id=:issue_id' => 'comments#edit'
  post 'comments?issue_id=:issue_id' => 'comments#create'
  resources :comments
  resources :issues
  resources :users
  root 'issues#index'
end
