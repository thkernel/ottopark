class CreateVehicleModels < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicle_models do |t|
      t.string :uid
      t.string :name
      t.references :manufacturer, foreign_key: true
      t.references :vehicle_type, foreign_key: true
      t.string :model_year
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
