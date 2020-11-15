class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :uid
      t.string :name
      t.integer :capacity
      t.string :address
      t.string :country
      t.string :city
      t.string :manager
      t.string :status
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
