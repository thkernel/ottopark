# == Schema Information
#
# Table name: shiftings
#
#  id          :bigint           not null, primary key
#  motif       :string
#  vehicle_id  :bigint
#  departure   :string
#  arrival     :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ShiftingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
