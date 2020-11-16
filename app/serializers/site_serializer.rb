# == Schema Information
#
# Table name: sites
#
#  id          :bigint           not null, primary key
#  uid         :string
#  title       :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SiteSerializer < ActiveModel::Serializer
  attributes :id, :uid, :title, :description, :status
  has_one :user
end
