class CreateCreditProducts < ActiveRecord::Migration
  def change
    create_table :credit_products do |t|
      t.string :name

      t.integer :sum_policy_id
      t.integer :duration_policy_id
      t.integer :fine_policy_id
      t.integer :payment_policy_id
      t.integer :percent_policy_id

      t.timestamps
    end
  end
end
