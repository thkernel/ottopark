# == Schema Information
#
# Table name: vehicle_types
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class VehicleType < ApplicationRecord
  include SharedUtils::Generate
  before_save :generate_random_number_uid
  
  belongs_to :user
end
