# == Schema Information
#
# Table name: features
#
#  id            :bigint           not null, primary key
#  uid           :string
#  name          :string
#  subject_class :string
#  description   :text
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class FeatureSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name
end
