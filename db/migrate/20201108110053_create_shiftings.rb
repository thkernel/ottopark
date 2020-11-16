class CreateShiftings < ActiveRecord::Migration[5.2]
  def change
    create_table :shiftings do |t|
      t.string :motif
      t.references :vehicle, foreign_key: true
      t.string :departure
      t.string :arrival
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
