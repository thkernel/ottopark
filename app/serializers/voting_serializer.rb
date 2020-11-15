# == Schema Information
#
# Table name: votings
#
#  id           :bigint           not null, primary key
#  uid          :string
#  poll_item_id :bigint
#  status       :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class VotingSerializer < ActiveModel::Serializer
  attributes :id, :uid, :status
  has_one :poll
  has_one :user
end
