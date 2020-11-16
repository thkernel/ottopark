class CreateTaxDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_disks do |t|
      t.references :vehicle, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :reference
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
