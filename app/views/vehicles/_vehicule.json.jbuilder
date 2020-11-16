json.extract! vehicule, :id, :uid, :vehicule_type_id, :vehicule_brand_id, :vehicule_model, :serial_number, :chassis_number, :immatriculation_number, :color, :manufacture_date, :mileage, :statut, :geographic_location, :user_id, :created_at, :updated_at
json.url vehicule_url(vehicule, format: :json)
