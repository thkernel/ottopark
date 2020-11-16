# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  uid        :string
#  first_name :string
#  last_name  :string
#  civility   :string
#  address    :string
#  country    :string
#  city       :string
#  phone      :string
#  about      :text
#  status     :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProfileSerializer < ActiveModel::Serializer
  attributes :id
end
