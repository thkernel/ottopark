class InsuranceSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :insurance_number, :pre_tax_amount, :vat_rate, :amount_including_tax, :status
  has_one :insurer
  has_one :vehicule
  has_one :user
end
