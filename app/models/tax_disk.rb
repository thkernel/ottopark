# == Schema Information
#
# Table name: tax_disks
#
#  id                   :bigint           not null, primary key
#  vehicle_id           :bigint
#  start_date           :datetime
#  end_date             :datetime
#  reference            :string
#  pre_tax_amount       :float            default(0.0)
#  vat_rate             :float            default(0.0)
#  vat_amount           :float            default(0.0)
#  amount_including_tax :float            default(0.0)
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class TaxDisk < ApplicationRecord
  belongs_to :vehicule
  belongs_to :user
end
