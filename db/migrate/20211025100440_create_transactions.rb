class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :send_by_id
      t.integer :receive_by_id
      t.float :amount
      t.text :note
      t.timestamps

      t.index :send_by_id
      t.index :receive_by_id
    end
  end
end
