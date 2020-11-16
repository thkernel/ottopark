# == Schema Information
#
# Table name: parks
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  capacity    :integer
#  address     :string
#  country     :string
#  city        :string
#  manager     :string
#  status      :string
#  description :text
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ParkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
