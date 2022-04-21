class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      # t.string :payer
      t.belongs_to :user
      t.belongs_to :payer

      t.integer :points

      t.datetime :timestamp
    end
  end
end
