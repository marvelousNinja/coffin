class AddAccountIdToLoanAgreement < ActiveRecord::Migration
  def change
    add_column :loan_agreements, :account_id, :integer
  end
end
