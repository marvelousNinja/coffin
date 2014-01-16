class CreatePaymentPolicies < ActiveRecord::Migration
  def change
    create_table :payment_policies do |t|
      t.string :type

      t.integer :credit_product_id

      t.timestamps
    end
  end
end
