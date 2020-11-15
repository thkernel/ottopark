class Insurance < ApplicationRecord
  belongs_to :insurer
  belongs_to :vehicule
  belongs_to :user
end
