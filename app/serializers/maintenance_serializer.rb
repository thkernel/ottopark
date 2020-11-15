class MaintenanceSerializer < ActiveModel::Serializer
  attributes :id, :uid, :fee, :service_provider, :status, :description
  has_one :maintenance_type
  has_one :user
end
