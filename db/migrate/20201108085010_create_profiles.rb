class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :civility
      t.string :address
      t.string :country
      t.string :city
      t.string :phone
      t.text :about
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
