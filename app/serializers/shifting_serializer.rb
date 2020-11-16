# == Schema Information
#
# Table name: shiftings
#
#  id          :bigint           not null, primary key
#  motif       :string
#  vehicle_id  :bigint
#  departure   :string
#  arrival     :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ShiftingSerializer < ActiveModel::Serializer
  attributes :id, :motif, :departure, :arrival, :description, :status
  has_one :vehicule
  has_one :user
end
