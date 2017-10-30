json.extract! user, :id, :full_name, :username, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
