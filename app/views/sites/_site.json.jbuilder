json.extract! site, :id, :uid, :title, :description, :status, :user_id, :created_at, :updated_at
json.url site_url(site, format: :json)
