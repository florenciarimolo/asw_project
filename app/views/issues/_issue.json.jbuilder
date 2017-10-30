json.extract! issue, :id, :title, :type, :priority, :status, :votes, :assignee, :created, :updated, :description, :created_at, :updated_at
json.url issue_url(issue, format: :json)
