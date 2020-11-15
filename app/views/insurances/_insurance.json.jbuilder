json.extract! insurance, :id, :insurer_id, :vehicule_id, :start_date, :end_date, :insurance_number, :pre_tax_amount, :vat_rate, :amount_including_tax, :status, :user_id, :created_at, :updated_at
json.url insurance_url(insurance, format: :json)
