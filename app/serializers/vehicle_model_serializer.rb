# == Schema Information
#
# Table name: vehicle_models
#
#  id              :bigint           not null, primary key
#  uid             :string
#  name            :string
#  manufacturer    :string
#  vehicle_type_id :bigint
#  model_year      :string
#  status          :string
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class VehicleModelSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :manufacturer, :status
  has_one :vehicle_type
  has_one :user
end
