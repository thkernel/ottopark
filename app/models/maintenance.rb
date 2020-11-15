class Maintenance < ApplicationRecord
  belongs_to :maintenance_type
  belongs_to :user
end
