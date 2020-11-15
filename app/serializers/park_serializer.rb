class ParkSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :capacity, :address, :country, :city, :manager, :status, :description, :user
end
