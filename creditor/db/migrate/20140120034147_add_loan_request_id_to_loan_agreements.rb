class AddLoanRequestIdToLoanAgreements < ActiveRecord::Migration
  def change
    add_column :loan_agreements, :loan_request_id, :integer
  end
end
