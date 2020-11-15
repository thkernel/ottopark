class CreateInsurances < ActiveRecord::Migration[5.2]
  def change
    create_table :insurances do |t|
      t.references :insurer, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :insurance_number
      t.float :pre_tax_amount, default: 0.0
      t.float :vat_rate, default: 0.0
      t.float :vat_amount, default: 0.0
      t.float :amount_including_tax, default: 0.0
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
