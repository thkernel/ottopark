class VehicleModelSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :manufacturer, :status
  has_one :vehicle_type
  has_one :user
end
