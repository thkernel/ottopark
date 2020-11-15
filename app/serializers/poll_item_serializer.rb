# == Schema Information
#
# Table name: poll_items
#
#  id         :bigint           not null, primary key
#  slug       :string
#  uid        :string
#  poll_id    :bigint
#  title      :string
#  subtitle   :string
#  content    :text
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PollItemSerializer < ActiveModel::Serializer
  attributes :id, :uid, :title, :subtitle, :content, :status
  has_one :poll
end
