class Consumption < ApplicationRecord
  belongs_to :vehicle
  belongs_to :driver
  belongs_to :user
end
