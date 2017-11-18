Rails.application.routes.draw do
  resources :comments
  post "/issues/:id/comments/new" => "comments#create"
  resources :issues do
      resources :comments
  end
  resources :users
  root 'issues#index'
end
