class SiteSerializer < ActiveModel::Serializer
  attributes :id, :uid, :title, :description, :status
  has_one :user
end
