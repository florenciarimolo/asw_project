json.extract! comment, :id, :user, :comment, :issue, :created_at, :updated_at
json.url comment_url(comment, format: :json)
