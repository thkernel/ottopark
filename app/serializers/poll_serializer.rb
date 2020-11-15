# == Schema Information
#
# Table name: polls
#
#  id               :bigint           not null, primary key
#  slug             :string
#  uid              :string
#  poll_category_id :bigint
#  start_date       :datetime
#  end_date         :datetime
#  title            :string
#  subtitle         :string
#  published        :boolean
#  content          :text
#  status           :string
#  user_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class PollSerializer < ActiveModel::Serializer
  attributes :id, :uid, :title, :subtitle, :content, :status
  has_one :poll_category
  has_one :user
end
