class CreateInsurers < ActiveRecord::Migration[5.2]
  def change
    create_table :insurers do |t|
      t.string :uid
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :country
      t.string :city
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
