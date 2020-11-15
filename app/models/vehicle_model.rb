class VehicleModel < ApplicationRecord
  belongs_to :vehicle_type
  belongs_to :user
end
