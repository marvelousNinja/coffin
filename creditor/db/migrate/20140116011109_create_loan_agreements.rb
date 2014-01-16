class CreateLoanAgreements < ActiveRecord::Migration
  def change
    create_table :loan_agreements do |t|
      # Sum policy
      t.integer :initial_loan_sum

      # Percent policies
      t.decimal :loan_percent

      # Duration policy
      t.integer :duration

      # Fine policy
      t.decimal :fine_percent

      # Payment policy
      t.string :payment_method
      t.decimal :advanced_repayment_percent

      t.integer :credit_product_id

      t.timestamps
    end
  end
end
