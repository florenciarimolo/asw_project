json.extract! issue, :id, :title, :kind, :priority, :status, :votes, :assignee, :created, :updated, :description, :created_at, :updated_at
json.url issue_url(issue, format: :json)
