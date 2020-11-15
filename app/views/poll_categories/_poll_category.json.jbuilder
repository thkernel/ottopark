json.extract! poll_category, :id, :uid, :name, :description, :status, :user_id, :created_at, :updated_at
json.url poll_category_url(poll_category, format: :json)
