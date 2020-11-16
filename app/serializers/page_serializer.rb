# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  uid        :string
#  slug       :string
#  title      :string
#  content    :text
#  status     :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PageSerializer < ActiveModel::Serializer
  attributes :id, :uid, :slug, :title, :content, :status
  has_one :user
end
