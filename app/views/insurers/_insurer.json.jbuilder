json.extract! insurer, :id, :uid, :name, :address, :phone, :email, :country, :city, :status, :user_id, :created_at, :updated_at
json.url insurer_url(insurer, format: :json)
