class ConsumptionSerializer < ActiveModel::Serializer
  attributes :id, :uid, :quantity, :unit, :status, :description
  has_one :vehicle
  has_one :driver
  has_one :user
end
