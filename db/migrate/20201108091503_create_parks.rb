class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :uid
      t.string :name
      t.integer :capacity
      t.string :address
      t.string :country
      t.string :city
      t.references :manager, index: true
      t.string :status
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
