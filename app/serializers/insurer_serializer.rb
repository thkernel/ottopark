class InsurerSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :address, :phone, :email, :country, :city, :status
  has_one :user
end
