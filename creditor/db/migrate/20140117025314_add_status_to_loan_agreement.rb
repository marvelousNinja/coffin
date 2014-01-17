class AddStatusToLoanAgreement < ActiveRecord::Migration
  def change
    add_column :loan_agreements, :status, :string, default: 'not_approved'
  end
end
