class ShiftingSerializer < ActiveModel::Serializer
  attributes :id, :motif, :departure, :arrival, :description, :status
  has_one :vehicule
  has_one :user
end
