class CreateVehicleTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicle_types do |t|
      t.string :uid
      t.string :name
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
