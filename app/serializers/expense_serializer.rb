class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :uid, :fee, :status, :description
  has_one :expense_type
  has_one :user
end
