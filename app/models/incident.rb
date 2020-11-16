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

class Incident < ApplicationRecord
  belongs_to :user
end
