class CreateTechnicalVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :technical_visits do |t|
      t.references :vehicle, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :reference
      t.float :pre_tax_amount
      t.float :vat_rate
      t.float :amount_including_tax
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
