class CreateMaintenances < ActiveRecord::Migration[5.2]
  def change
    create_table :maintenances do |t|
      t.references :vehicle, foreign_key: true
      t.references :maintenance_type, foreign_key: true
      t.string :uid
      t.float :pre_tax_amount, default: 0.0
      t.float :vat_rate, default: 0.0
      t.float :vat_amount, default: 0.0
      t.float :amount_including_tax, default: 0.0
      t.string :service_provider
      t.string :status
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
