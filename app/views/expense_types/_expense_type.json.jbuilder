json.extract! expense_type, :id, :uid, :name, :status, :description, :user_id, :created_at, :updated_at
json.url expense_type_url(expense_type, format: :json)
