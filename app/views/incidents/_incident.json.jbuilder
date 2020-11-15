json.extract! incident, :id, :uid, :title, :description, :status, :level, :user_id, :created_at, :updated_at
json.url incident_url(incident, format: :json)
