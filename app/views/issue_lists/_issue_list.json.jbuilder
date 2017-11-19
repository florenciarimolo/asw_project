json.extract! issue_list, :id, :name, :created_at, :updated_at
json.url issue_list_url(issue_list, format: :json)
