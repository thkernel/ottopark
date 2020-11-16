class VehiculeSerializer < ActiveModel::Serializer
  attributes :id, :uid, :vehicule_model, :serial_number, :chassis_number, :immatriculation_number, :color, :manufacture_date, :mileage, :statut, :geographic_location
  has_one :vehicule_type
  has_one :vehicule_brand
  has_one :user
end
