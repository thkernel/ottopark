# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  uid          :string
#  first_name   :string
#  last_name    :string
#  civility     :string
#  profession   :string
#  address      :string
#  country      :string
#  city         :string
#  locality     :string
#  neighborhood :string
#  phone        :string
#  about        :text
#  status       :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Profile < ApplicationRecord
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :user
  

  # For active storage
  has_one_attached :avatar


  def full_name
    "#{first_name} #{last_name}"
  end
  
end
