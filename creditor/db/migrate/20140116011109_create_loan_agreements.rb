class CreateLoanAgreements < ActiveRecord::Migration
  def change
    create_table :loan_agreements do |t|
      t.integer :credit_product_id

      t.timestamps
    end
  end
end
