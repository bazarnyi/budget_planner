class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount, null: false
      t.datetime :date
      t.string :comment
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
