# == Schema Information
#
# Table name: incidents
#
#  id          :bigint           not null, primary key
#  uid         :string
#  title       :string
#  description :text
#  status      :string
#  level       :string
#  vehicle_id  :bigint
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class IncidentSerializer < ActiveModel::Serializer
  attributes :id, :uid, :title, :description, :status, :level
  has_one :user
end
