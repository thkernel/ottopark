class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.string :uid
      t.string :title
      t.text :description
      t.string :status
      t.string :level
      t.references :vehicle, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
