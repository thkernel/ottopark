class ExpenseTypeSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :status, :description
  has_one :user
end
