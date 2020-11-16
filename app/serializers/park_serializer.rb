# == Schema Information
#
# Table name: parks
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  capacity    :integer
#  address     :string
#  country     :string
#  city        :string
#  manager     :string
#  status      :string
#  description :text
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ParkSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :capacity, :address, :country, :city, :manager, :status, :description, :user
end
