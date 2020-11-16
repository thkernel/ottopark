json.extract! technical_visit, :id, :vehicule_id, :start_date, :end_date, :reference, :pre_tax_amount, :vat_rate, :amount_including_tax, :status, :user_id, :created_at, :updated_at
json.url technical_visit_url(technical_visit, format: :json)
