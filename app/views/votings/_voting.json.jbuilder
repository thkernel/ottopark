json.extract! voting, :id, :uid, :poll_id, :status, :user_id, :created_at, :updated_at
json.url voting_url(voting, format: :json)
