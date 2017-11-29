json.extract! project, :id, :name, :description, :bugs_num, :created_at, :updated_at
json.url project_url(project, format: :json)
