class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :uid
      t.references :vehicle_model, foreign_key: true
      t.string :chassis_number
      t.string :immatriculation_number
      t.float  :purchase_value, default: 0.0
      t.float  :residual_value, default: 0.0
      t.string :color
      t.datetime :manufacture_date
      t.datetime :circulation_date
      t.string :mileage
      t.string :fuel_type
      t.string :statut

      t.references :park, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
