json.extract! expense, :id, :expense_type_id, :uid, :fee, :status, :description, :user_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
