# == Schema Information
#
# Table name: insurances
#
#  id                   :bigint           not null, primary key
#  insurer_id           :bigint
#  vehicle_id           :bigint
#  start_date           :datetime
#  end_date             :datetime
#  insurance_number     :string
#  pre_tax_amount       :float            default(0.0)
#  vat_rate             :float            default(0.0)
#  vat_amount           :float            default(0.0)
#  amount_including_tax :float            default(0.0)
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class InsuranceSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :insurance_number, :pre_tax_amount, :vat_rate, :amount_including_tax, :status
  has_one :insurer
  has_one :vehicule
  has_one :user
end
