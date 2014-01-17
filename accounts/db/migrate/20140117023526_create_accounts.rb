class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :add, default: 0
      t.integer :balance, default: 0

      t.timestamps
    end
  end
end
