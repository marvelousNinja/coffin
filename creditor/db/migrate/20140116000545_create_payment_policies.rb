class CreatePaymentPolicies < ActiveRecord::Migration
  def change
    create_table :payment_policies do |t|
      t.string :type

      t.timestamps
    end
  end
end
