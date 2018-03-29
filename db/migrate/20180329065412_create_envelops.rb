class CreateEnvelops < ActiveRecord::Migration[5.1]
  def change
    create_table :envelops do |t|
      t.decimal :amount
      t.integer :category, null: false, default: 0
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
