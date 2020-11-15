class IncidentSerializer < ActiveModel::Serializer
  attributes :id, :uid, :title, :description, :status, :level
  has_one :user
end
