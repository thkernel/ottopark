class OdometerSerializer < ActiveModel::Serializer
  attributes :id, :uid, :mileage, :unit, :status, :description
  has_one :vehicle
  has_one :driver
  has_one :user
end
