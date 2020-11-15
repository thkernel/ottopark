# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  uid          :string
#  poll_item_id :bigint
#  content      :text
#  status       :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :uid, :content, :status
  has_one :poll
  has_one :user
end
