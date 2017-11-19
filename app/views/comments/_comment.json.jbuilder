json.extract! comment, :id, :user, :comment, :issue_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
