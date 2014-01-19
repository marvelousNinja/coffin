class AddUserToLoanAgreements < ActiveRecord::Migration
  def change
    add_column :loan_agreements, :user_id, :integer
  end
end
