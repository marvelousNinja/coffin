class CreateSumPolicies < ActiveRecord::Migration
  def change
    create_table :sum_policies do |t|
      t.integer :min
      t.integer :max

      t.integer :credit_product_id

      t.timestamps
    end
  end
end
