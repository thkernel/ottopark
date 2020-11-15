class RoleSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :description, :status
end
