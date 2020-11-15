class Vehicule < ApplicationRecord
  belongs_to :vehicule_type
  belongs_to :vehicule_brand
  belongs_to :user
end
