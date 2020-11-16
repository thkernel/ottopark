# == Schema Information
#
# Table name: vehicle_models
#
#  id              :bigint           not null, primary key
#  uid             :string
#  name            :string
#  manufacturer    :string
#  vehicle_type_id :bigint
#  model_year      :string
#  status          :string
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class VehicleModelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
