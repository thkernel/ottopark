class CreateExpenseTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_types do |t|
      t.string :uid
      t.string :name
      t.string :status
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
