Rails.application.routes.draw do
  #get /comments/index =>  /comments?issue_id=:issue_id
  #get /comments/show => /comments/1?issue_id=:issue_id
  #get /comments/new => /comments/new?issue_id=:issue_id
  #get /comments/edit => /comments/1/edit?issue_id=:issue_id
  #post /comments/create => /comments?issue_id=:issue_id
  resources :comments
  resources :issues
  resources :users
  root 'issues#index'
end
