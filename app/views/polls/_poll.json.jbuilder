json.extract! poll, :id, :uid, :poll_category_id, :title, :subtitle, :content, :status, :user_id, :created_at, :updated_at
json.url poll_url(poll, format: :json)
