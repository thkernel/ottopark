class TaxDisk < ApplicationRecord
  belongs_to :vehicule
  belongs_to :user
end
