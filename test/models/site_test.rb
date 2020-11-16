# == Schema Information
#
# Table name: sites
#
#  id          :bigint           not null, primary key
#  uid         :string
#  title       :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
